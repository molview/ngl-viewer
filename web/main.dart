// Copyright (c) 2016, Herman Bergwerf. All rights reserved.
// Use of this source code is governed by an AGPL-3.0-style license
// that can be found in the LICENSE file.

import 'package:ngl_viewer/promise.dart';
import 'package:ngl_viewer/ngl_viewer.dart' as ngl;

Future main() async {
  ngl.mainScriptFilePath = 'packages/ngl_viewer/ngl.js';

  final stageSettings = new ngl.StageParams(quality: ngl.RenderQuality.low);
  final loadFileParams = new ngl.LoadFileParams(defaultRepresentation: true);

  final stage = new ngl.Stage('ngl-viewer', stageSettings);
  final comp = await fut(stage.loadFile('rcsb://4V60', loadFileParams));
  for (final r in comp.reprList) {
    final params = r.repr.getParameters();
    params.disablePicking = true;
    r.repr.setParameters(params);
  }
}
