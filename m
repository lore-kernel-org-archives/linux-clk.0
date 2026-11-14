Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668089;
	b=bA4A+oX1StP2e4jZr+9eIWb0eGUTYk/BsgwLZjzG42KQoYsn0OF0tINhJFPwKs6sh3IO
	 7WA2Ws+haMCdzGvVz9u8+5ni3rSt79CcUeCzBef3ml4iudq4PKsmPRQHYRslBX4EPsHjT
	 E+1CdbGSId5A6NFK7f5EEuGa27XhK+A2kv8azhPQ6lrQfjCEfHsHmJg7FbdA8eFUB990e
	 EiiUg/Pnp1VfrRHUdyuKw28gCEdHKljFyUZ0asxw/OwRWFwpGM0KoRST0C6tqZC/LmEix
	 vYiXWkglXY1KpbdFLXfb0ckLsXUbeBAGiNl/id1yS6qm1XhHOTbLKo4+0nYjQ588BoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668089;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Z+JvddxmtKKmKsMf6j11IXMqbckTeUGbZPYCx5MAjlI=;
	b=aHCQhhNZzW0ioPLb9y1OZPNPEiUnm1Fmomx7T+FU15Db0leu65eBfm0eE/8Eqc6dyb0t
	 TkrN3TNecPMci/KqO5frLoRqE8EaTdFuRe92RKyxdVAjih0gtG4sypyqihT7f6OS2tti1
	 4zzDaCaGjsvLeF7ukeVSzu+1Rp6JpstYe2rILOtI8IoZY+xw7DJEXHDQFmwpQV/eGxAek
	 C4Ef78iSZhe7ly5udAI5QPZ0sQ9K13nuLHjMAPqkF9cxFlp0J4R8odPNA5sSW5he+qjvg
	 f7VqqtTEhA7CutEQ4axQQrnwxy3PKKK0TJzsRKnRYrkV2cmL6EVt7Fu3SwAnkZBRjJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CAD606A323;
	Sat, 14 Nov 2026 14:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5CAD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSF9G-000000005Gc-2tNt;
	Sat, 14 Nov 2026 14:54:34 +0000
Date: Sat, 14 Nov 2026 14:54:25 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc: nicolas.dufresne@collabora.com, detlev.casanova@collabora.com,
	paulk@sys-base.io, ezequiel@vanguardiasur.com.ar
Subject: [RFC PATCH 0/6] media: rockchip: RKVENC v1 H.264/HEVC encoder for
 the RV1126
Message-ID: <cover.1794666330.git.daniel@makrotopia.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This RFC adds a driver for RKVENC v1, the H.264 and HEVC video encoder
of the Rockchip RV1109 and RV1126 (Rockchip calls this generation
"vepu541"; the RK3566 and RK3568 carry the "vepu540" variant). It is a
stateful V4L2 memory-to-memory encoder: NV12 or NV12M in, H.264 or HEVC
Annex B out, low-delay IDR plus P pictures with a single reference, no
B frames. The driver writes the parameter sets (SPS, PPS and VPS), the
hardware writes the slice headers and data. Rate control is frame
level, in the driver: CBR with one QP per picture, the hardware row
rate control stays off. The core clock follows the load through
devfreq and the encoder registers as a cooling device. No new uAPI is
added; the driver uses the existing stateful encoder controls and
formats only.

The series:
  1  binding (with MAINTAINERS entry)
  2  RV1126 clock tree of the VEPU power domain
  3  the driver
  4  frequency scaling and cooling
  5  RV1126 device tree node, IOMMU, power domain and QoS nodes
  6  RV1126 operating points

It is an RFC because of the questions below, which decide where and
in which shape this can go.

Hardware and testing:

I have tested H.264 and H.265 encoding extensively with this driver on
Linux 6.18 in an RV1126 IP camera (Herospeed board, Sony IMX415
sensor) behind the RV1126 ISP, including 3856x2192 and 1280x720 H.265
at 30 fps streamed continuously over RTSP. The driver has been part of
the OpenWrt rockchip/armv7 target since 2026-10-17
(target/linux/rockchip/patches-6.18/183-*), so that testing can be
reproduced by anyone with the hardware.

The port to linux-next in this series is compile-tested only: gcc 16.2
and clang 23, both with W=1, ARM multi_v7_defconfig plus the RKVENC
options; dt_binding_check on the binding and dtbs_check on the RV1109
and RV1126 boards in tree, all without warnings (dtschema 2026.9).
Against the 6.18 code the driver differs in the cooling device
registration signature of the base, kzalloc_obj(), one min_t(), a few
named constants and its comments.

Design questions:

There is no stateless encoder framework upstream yet. The driver
implements a stateful front end only, and keeps the hardware back end
apart from it so that it can move to stateless infrastructure once
that exists:

- Hardware back end: rkvenc.c (job start, interrupt, recovery,
  watchdog, power), rkvenc-vepu541*.c (the register image, built from
  struct rkvenc_frame, which carries no V4L2 types), the tuning tables,
  rkvenc-ref.c (reconstruction and reference buffers) and
  rkvenc-dvfs.c.
- Codec front end: rkvenc-gop.c (IDR cadence, forced key frames, which
  slot is the reference), rkvenc-h264.c and rkvenc-hevc.c (frame_num,
  POC, idr_pic_id and NAL type of each picture), rkvenc-nal.c (the
  parameter set writer) and rkvenc-rc.c (the picture QP).
- V4L2 binding: rkvenc-v4l2.c.

Under the H.264 stateless encode series Paul posted in May, userspace
decides the frame type, frame_num, POC and references and passes them
in V4L2_CID_STATELESS_H264_ENCODE_PARAMS, while header writing and rate
control stay in the kernel as shared helpers. Applied to this driver,
rkvenc-gop.c and the picture fields of rkvenc-h264.c become userspace
input, rkvenc-nal.c and rkvenc-rc.c give way to the shared helpers,
and the back end stays as it is: struct rkvenc_frame is already the
per-picture state such a core hands to a driver. The single reference
with sliding window marking in that series is what the two-slot
reference handling here implements. HEVC has no posted stateless
encode uAPI at the moment. Still to be done for a conversion: the GOP,
reference and rate control code works on struct rkvenc_ctx, which also
carries the V4L2 file handle and control state, and the parameter set
code reads V4L2 control enums; both need a codec state of their own.

Questions:

1. Conformance of a stateful encoder.

   The maintainer entry profile requires v4l2-compliance to pass, and
   dev-encoder.rst defines the interface, but there is no fluster
   equivalent for encoders, and Nicolas noted in January 2025 that we
   have no metric of how good or bad the in-tree encoders are. The plan
   for the next version is: v4l2-compliance -s with streaming from a
   file, plus every stream decoded by FFmpeg and by the H.264 JM and
   HEVC HM reference decoders, the decoded pictures required to be
   bit-identical between the decoders, PSNR reported per picture
   against the source, a static-scene sequence to catch
   encoder/decoder drift, and the bitrate of CBR runs reported against
   the target. Is that what you expect to see for a new encoder, is
   there a test corpus or tool you would rather have used, and should
   the results go into the cover letter or somewhere else?

2. Staging or drivers/media/platform/rockchip.

   hantro and rkvdec were staged because the stateless uAPI was not
   stable yet, see commit fbb6c848dd89 ("media: destage Hantro VPU
   driver"), and allegro left staging once the stateful encoder API
   was final, see commit d74d4e2359ec ("media: allegro: move driver
   out of staging"). This driver uses only the stable stateful encoder
   uAPI and adds no controls, formats or ioctls of its own, so it is
   posted for drivers/media/platform/rockchip/rkvenc. The in-kernel
   rate control and the driver-written parameter sets are the parts
   that differ from the firmware-based stateful encoders in tree. Do
   either of them, or anything else, argue for staging in your view?

3. Stateful now, and the back end for the stateless work?

   dev-encoder.rst strongly discourages header generation in the
   driver for a stateful encoder and advises the stateless encoder
   interface instead, and in the VEPU510 thread Nicolas asked not to
   offer two interfaces for the same hardware. RKVENC v1 is the
   generation before VEPU510/VEPU580, its main users are 32-bit camera
   SoCs whose userspace is GStreamer and v4l2 RTSP servers, and no
   other interface for it has been posted. Nicolas also asked for a
   second implementation of the stateless encoder spec, from another
   vendor than the VC8000E. Would you take the stateful driver now,
   with its back end offered as that second implementation and the
   driver converted once the spec is merged, or should RKVENC v1 only
   come as a stateless driver?

4. Naming. The binding is rockchip,rv1126-rkvenc.yaml with the
   compatibles rockchip,rv1126-rkvenc and rockchip,rk3568-rkvenc, and
   the driver directory rockchip/rkvenc. The RK3576 and RK3588 RFCs
   below used rockchip/rkvenc for a different generation of the
   block. Should RKVENC v1 keep that directory and those names, or
   take generation specific ones (for example vepu541)?

5. RK3566/RK3568. The driver matches rockchip,rk3568-rkvenc with the
   vepu540 variant data, but I don't have hardware to actuall test
   that. Keep the compatible for a later RK356x series, or drop it
   until someone with the hardware has done some testing?

Related postings:

- Jiaxing Hu, "[RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder
  for RK3576", stateful, I frames only; the author moved to the Vulkan
  Video direction in the thread:
  https://lore.kernel.org/all/20260722073417.2064667-1-gahing@gahingwoo.com/
- Arun Iyengar, "[PATCH RFC 00/12] media: rockchip: Add a VEPU580
  stateless H.264/HEVC encoder driver for the RK3588", withdrawn by
  the author on 2026-11-13:
  https://lore.kernel.org/all/20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com/
- Paul Kocialkowski, "[PATCH 00/14] media: Add V4L2 H.264 stateless
  encode and VC8000E support":
  https://lore.kernel.org/all/20260522101653.2565125-1-paulk@sys-base.io/

Not in this series:

- Binding the encoder to the RV1126 NPU thermal zone, the zone that
  covers the VEPU power domain. It needs RV1126 TSADC support, which is
  not in mainline yet, and follows with it.
- venc-supply on the RV1126 boards in tree. Their encoder shares the
  vdd_npu_vepu rail with the NPU.

Provenance:

There is no public documentation of this block. The driver was written
by reverse engineering the hardware, with the Rockchip MPP userspace
library as a behavioural reference. A spec was derived by an LLM
agent, and that spec was then used to create the driver

Tool use:

Most of this series was written with multiple LLM coding assistants:
The spec was derived by Claude Sonnet 5.5, handed to a locally run
Qwen3.8-37B which carried out the initial implementation. Claude
Opus 5.5 then did the initial testing and bug fixing, and pre-submission
polishment under my micro-management.
The full test coverage, and long-term testing on the off-the-shelf camera
was done by me.

Daniel Golle (6):
  dt-bindings: media: Add Rockchip RKVENC v1 video encoder
  clk: rockchip: rv1126: Add PD_VEPU clock tree
  media: rockchip: Add RKVENC v1 video encoder driver
  media: rockchip: rkvenc: Add frequency scaling and cooling
  ARM: dts: rockchip: Add RKVENC encoder to RV1126
  ARM: dts: rockchip: Add RKVENC operating points to RV1126

 .../media/rockchip,rv1126-rkvenc.yaml         |  104 ++
 MAINTAINERS                                   |    8 +
 arch/arm/boot/dts/rockchip/rv1126.dtsi        |   80 ++
 drivers/clk/rockchip/clk-rv1126.c             |   21 +
 drivers/media/platform/rockchip/Kconfig       |    1 +
 drivers/media/platform/rockchip/Makefile      |    1 +
 .../media/platform/rockchip/rkvenc/Kconfig    |   20 +
 .../media/platform/rockchip/rkvenc/Makefile   |   16 +
 .../platform/rockchip/rkvenc/rkvenc-dvfs.c    |  364 ++++++
 .../platform/rockchip/rkvenc/rkvenc-gop.c     |   72 ++
 .../platform/rockchip/rkvenc/rkvenc-h264.c    |   82 ++
 .../platform/rockchip/rkvenc/rkvenc-hevc.c    |   63 +
 .../platform/rockchip/rkvenc/rkvenc-nal.c     |  351 ++++++
 .../platform/rockchip/rkvenc/rkvenc-nal.h     |   12 +
 .../platform/rockchip/rkvenc/rkvenc-rc.c      |  214 ++++
 .../platform/rockchip/rkvenc/rkvenc-ref.c     |  114 ++
 .../platform/rockchip/rkvenc/rkvenc-v4l2.c    | 1085 +++++++++++++++++
 .../rockchip/rkvenc/rkvenc-vepu541-h264.c     |  206 ++++
 .../rockchip/rkvenc/rkvenc-vepu541-hevc.c     |  182 +++
 .../rockchip/rkvenc/rkvenc-vepu541-regs.h     |  283 +++++
 .../rockchip/rkvenc/rkvenc-vepu541-tables.c   |  256 ++++
 .../platform/rockchip/rkvenc/rkvenc-vepu541.c |  215 ++++
 .../platform/rockchip/rkvenc/rkvenc-vepu541.h |  201 +++
 .../media/platform/rockchip/rkvenc/rkvenc.c   |  498 ++++++++
 .../media/platform/rockchip/rkvenc/rkvenc.h   |  263 ++++
 25 files changed, 4712 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,rv1126-rkvenc.yaml
 create mode 100644 drivers/media/platform/rockchip/rkvenc/Kconfig
 create mode 100644 drivers/media/platform/rockchip/rkvenc/Makefile
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-dvfs.c
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-gop.c
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-h264.c
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-hevc.c
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-nal.c
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-nal.h
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-rc.c
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-ref.c
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-v4l2.c
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-vepu541-h264.c
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-vepu541-hevc.c
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-vepu541-regs.h
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-vepu541-tables.c
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-vepu541.c
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc-vepu541.h
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc.c
 create mode 100644 drivers/media/platform/rockchip/rkvenc/rkvenc.h


base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.56.0
