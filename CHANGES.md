# Recent Changes

* [2019/12/26] Revised DFT and DCT libraries (packages ``imagingbook.pub.dft``, ``imagingbook.pub.dct``) and associated ImageJ plugins (in ``imagingbook_plugins_all/Spectral_Techniques``). Added fast implementations based on the ``JTransforms`` package by Piotr Wendykier. Simplified Maven dependency setup (by automatically copying dependencies to ImageJ's jar folder).

* [2019/12/22] Submodules with plugins for specific book editions have been frozen and
will not be maintained any longer. The complete plugin collection is contained in
``imagingbook_plugins_all``. ZIP-archives of the specific plugin sets are now found in
``plugins-archive``.

* [2019/01/04] Revised geometric mappings (in package ``imagingbook.pub.geometry.mappings``) and related demo plugins. Image-to-image mappings were moved to the new class ``ImageMapper``, for mappings to handle only geometric aspects.
