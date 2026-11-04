Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788587;
	b=GNlV8R2MOJMLCKG9c6+4Ggu+NgI7mxwq4xtXzgNnoC7nXwawWI7zEJo4XBUK2klg0mQI
	 gmJub1NI1kKQBzhfT8FJESSC8laJ4HbcMHZrvLzCpXm+Truje05Sxp+v+NqZOBoj0V/sY
	 +QP6A04JyYO7q/+Hy3gH6/OqEd+Y+DjodCcJJBmZtABi27hTKm4EbetPZTKqPMbfoZoHV
	 hWETkO3gPD8/jmDtvo8HlufNc3/6GyGx9YEFl7bK2iSc3E379gc6icyE1HjHiAj6pU0kY
	 dYEv49Kpf5xHkePbvkJeWSImCt5t26Tfv/PO9cIY+w/pHM3BKghWxXP5M45TvCMY0JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IT2ld2hEUrh1U4ufhHP01T3lVawATcj2VlDSAq4lmcU=;
	b=tDRuxWho2YxCYj1y9X5LJp6ZSRP5R363msSXUQVrB9TmwagIoMQJHjyNsFONH0UpS8QB
	 czWo1khJFXw95JvabfsvPN4W0dI1OJhnD+8aJ/d73wYtNf1awYMjbuGNWjstIASrXoc89
	 ydZ8T436AmqWrmkP26/3UmGa4HRXT7yDAUhxMxLr5MnZ4E3cvMJhT2VQR8g/TcyKQF08g
	 zf9XciW8fidPzJOwRucm03080DhhU/CzOtwyQeIEhJXFDIefanc0iLET/vAq0vmI7iMRv
	 qpezQHgmF6ewCwHWWImrtIAQ68LG2AxqBA0MOcBVWT8bleCFugmbdhRyqAmx8N6833w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=U0y8BBhP;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07328606A330
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 10:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07328606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=U0y8BBhP
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so3532825e9.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 02:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793788584; x=1794393384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IT2ld2hEUrh1U4ufhHP01T3lVawATcj2VlDSAq4lmcU=;
        b=U0y8BBhP4gGZQTY455sX/GrgiSG6QsvOmloXZR7Epotwvm4hNK4TwD5Drm6fEhBFvy
         I0HE+XDKnPf7bF7O+FgzmYvogMME7v1ZH+UAi6WUMS9HfRka+zUBJNCbheK/cibGrrDT
         q8OHm2MyVmrGVG8U6+77/pI0tvqCHr7Err45Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788584; x=1794393384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IT2ld2hEUrh1U4ufhHP01T3lVawATcj2VlDSAq4lmcU=;
        b=yIUeOFru7+kv3hNyyzkZnHTnDwca+mEt5WJIhWJid91LJLzl04Jz7S+9AYuJWL86WZ
         qUrOcROAsGeellMT+IGz4Y0oW4XbRtiOVqKLG1z+W9gqPCFW6+b7JUqWMp4HDQCgUFES
         cDsrNkOgSTcRoBEnq+tn5ekrEF3Ckm7LB9uZzWYZFFBtl/HRTlyONwDxRv3yuxdS2i+l
         FLwL9jvaXaRoglOm2E4YS1EaQBV0t04wzuxVUIvC72ROLb8x9SXZrgg4hq7MXOX1XShx
         jIW3mpM2QPY1MDMDDKuzOKsIwSXQk8dNRVP+eD2w7DLAwK2wf3fgqOKXlBh7lgyHKS96
         2O4Q==
X-Forwarded-Encrypted: i=1; AKwUvByG2jHr6Y99FBNUfGIaAWoOPCaY2JkLdPEbU+vdcqvTCPfvs9RS+g2KP0UDu0oBTc+hway9mo8KR54=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iCjTIUGxevThYHQPQcR/S379A2YLljIIyorfCJ9mR1Ty+KsFl
	wsS2chdrZxLkNeWbPjUKp1MlWIVXnGHATGygK24AhBjwZRdhKkggdbI6V/VTBliTHyA=
X-Gm-Gg: AYBFou35LvyEanIMhdk89v0T0RNZ+LRCLdL1AYLqgypQI2AsoetcRSO9sM52CDec16H
	E5RnpShOXRgAUcK3c3wF8YoA6XylxjFJwaX3hdfZEU6h9Dtb3RcAodTtgHGIE3+cNOhvUzHgYMl
	xjv4PrMInMzl7xlaCal/KIgdzBM0MZxR9f8WMz3ZOQ/zv52dIcerLQy0piowXUHGWKnhV5I3LA3
	q5pQ+VNVyyBQZkewmn+VG9Bed2wOqBtLf4SL1FgSumIg37vigznY3KJNHB9yEZ0/UzoDsu2BOtc
	NNXI0OG1wK6BtOph3eblrf00WyvVmVU19G3Xdqw2YoRwIm/x6ds051t9/rqQHZM0+VhL2vP2/52
	JfR/54EP4cnC6+AH2qiMT4B06DDrr/UywuPO8fd3AkQr4d5d22OJ5CIl6JNP9DIJjBPysYqx4wy
	g8H0loGYN4qH76KlSV9SOIf+galumZ1RBPXyLfN9BHKCTey+/eUu0PD/yHT7tzdLqCSd/G8BLEk
	JOcxmHUjuQJOJjAlE1jXT5NEYR+61mUH8CikgOj5aC8syt9nqNQQxkRhfh8duKSY048bVnCXDWz
	ZZTTvF6ek0zUmCCrTOYYkFXylzVi/CU8e0EXbOt0TyKOPX3f0pts8NyCUYYBAv+T2CD+8f7wbb1
	6gLD3Y7ZekHySnDGn2tBjqFB45ooAezgGtP5vs/7bERpGut0n7Nc=
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr353454585e9.17.1793788584219;
        Wed, 04 Nov 2026 02:36:24 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm141685155e9.4.2026.11.04.02.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:36:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 0/2] clk: scmi: fix the i.MX OEM spread spectrum configuration
Date: Wed,  4 Nov 2026 11:36:01 +0100
Message-ID: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are the two patches of the v14 series [1] still pending, as
patches 2/4 and 4/4 have been merged in 7.4-rc1.

The first one is a fix for 7.3: the i.MX SCMI OEM extension converts
the spread to the wrong unit, so the hardware is programmed with no
spread at all for any valid configuration. The second one rejects the
configurations that do not fit in the OEM fields, instead of silently
truncating them.

Brian is waiting for an ack from the SCMI side on both patches.
Sudeep and the arm-scmi list were not Cc'ed on v14, as
get_maintainer.pl does not list them for clk-scmi-oem.c.

[1] https://lore.kernel.org/all/20260904101243.412006-1-dario.binacchi@amarulasolutions.com/

Changes in v15:
 - Drop patches 2/4 and 4/4, merged in 7.4-rc1.
 - Rebase on v7.4-rc1.

Changes in v14:
 - Move the fixes first, so that they can be picked up separately from
   the new patches.

Changes in v13:
 - Add patch "clk: scmi: reject SSC configuration out of the OEM field
   range".
 - Rename patch "clk: scmi: fix SSC permyriad conversion" to "clk: scmi:
   fix SSC spread conversion".

Changes in v12:
 - Add patch "clk: scmi: fix SSC permyriad conversion" to fix the
   permyriad to percent conversion in clk-scmi-oem.c, reported by
   Sashiko AI review.

Changes in v11:
 - Add patch "clk: Validate spread spectrum configuration" to reject
   invalid parameters in the clk core before they reach the providers.

Changes in v10:
- Drop patches 1-22, superseded by the generic spread spectrum clocking
  support from Peng Fan, merged in 7.3, so the i.MX8M specific infrastructure
  is no longer needed. This patch is now based on the following commits:
  - ae794aa6e88d ("dt-bindings: clock: Add spread spectrum definition")
  - c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
  - a7f16660af39 ("clk: conf: Support assigned-clock-sscs")
  - 7d98de6ffdab ("clk: Add KUnit tests for assigned-clock-sscs")
  https://lore.kernel.org/all/20260826165611.236321-1-sboyd@kernel.org/

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (2):
  clk: scmi: fix SSC spread conversion
  clk: scmi: reject SSC configuration out of the OEM field range

 drivers/clk/clk-scmi-oem.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
branch: imx-pll14xx-spread-spectrum

-- 
2.43.0

