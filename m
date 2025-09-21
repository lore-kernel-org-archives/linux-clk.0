Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5392737F4
	for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758477550; cv=none; b=YlNmwYsCzrjiYd7qcM+2R2ix90cn700io/ncpeb04oET0KElwGblnx8fiZz21cmetc0B0mg75OwJL1LZ5hGnILUTbCQj7xJ9ICzqzgACsCzA1Ie3nv1ohWqkdQz3/jvDOCNBlWe+vK5iN8GXz5iF6cXSoaSXQKWBXSgCYJ2sbwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758477550; c=relaxed/simple;
	bh=csrhZLgRqk0LyBv6H0m3QtRbPDuuNLS5kbPoTGl6p+k=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Or5qaL12HwTwjqiDFFL+WXAXoQWpxc6ZBrUegNRfdT0skALLGVdBPClgFsnYwDI6FrZ7R5WAb4A80hEqJ8y0YMqkEt6+YQFsLvSpgWIr26WVe1+zJIv8FWUlmE7cdgW0dKv2ezA1/LSIo1WaeNkflxK9OswyHD+2IDJliRjFBkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=bZRQKCDm; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="bZRQKCDm"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77f0efd84abso1305366b3a.3
        for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 10:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758477548; x=1759082348; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XizHke7K2MtvztyRNpSVD9+knHSzRe7eGtjqBPmYl0=;
        b=bZRQKCDmQIOkB/ae58ikKbU39vNfcfkpwUlj1DBo4C4+RnS8onpdxGUCVbyQhEmeVE
         ziIhh+kuTSDvGP1BQ/UFsZlXGwkuzpI41qZT11dEaEX9AuPds1pXfrBk0KJUDLW0z6sd
         5mEHnJ4BYIigJJXinO1/evVORcyuS1YGjOTA8xGpCKlfdIpNBn2OytfwofRNnCH47KKj
         xJpAz6GElU8dWkhLeTVeLKH8kA/XPcfPKAMSl+cPHf66MxUu2zhoBC0qqzj5Y5QLd10w
         zV+xSGV8+9K3afZ87+Nir7M56OQmcPs/z3gVlvdE31MSCFMoYUjGQrO61u9oO8rXX8ly
         Ohgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758477548; x=1759082348;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6XizHke7K2MtvztyRNpSVD9+knHSzRe7eGtjqBPmYl0=;
        b=a0ChEfFJEKu6FKk0+nRMrTerZzicLboVwhXBT6hONn856vEnqhVRF0pR1kFclEh0y8
         sMydHTi8/66uUwCQR5fRtpCyuRaIN7c6UuA8+p2w/Ii0bTJSteIWkf37nz24aplU5v/K
         9nsXRjjA++p0Nb0+znbl0+zODPxCkJn/PiSX91Ixsy1kKXl5r7nUtDNLToNvcy+aZuwp
         BA/JCcqadj3u8bzsY7M0CBtj6NkGGcvxVmJ5/LMKu85rJWWMOva5FlJTdedAvyAsuhoZ
         4IID5E9kbZ9zTPH4C4MWdZwF/t+pXlLGUtm2Odz/VaX8sDUWHwVrqW1dOCfD2uBn9F1Y
         YxLg==
X-Forwarded-Encrypted: i=1; AJvYcCVjk0s5ldgm4GXsoYwN6ezpQ8m4TJGUC94SFQgpPds7L3Zlt+6rwttdY/AxLYYp9OzgCYSG/h23ACQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWAJLqX8w7/rx26jn87ldBWSVbToxdmbcZb5owVNU9tcUT7WeR
	MKeru0iTZAnFoJVo5pL9f7fFFHcYw+9G1TTsIgv1IGebdMWEhgcivBLwfwBug0TYJ24=
X-Gm-Gg: ASbGncsPz//hPTLIokdM5AL8xXCpDIDUVk5e8790i0WWmhhOE5TMEvRPnUmhvQaqmFO
	idDucv8795uKa9GjqhuTxzvjnLkqYJp6E6tcGK0Z8lBShUiwEECtdYEck+LNrwkHCWgvIhg/UkJ
	131f4D2EFp6mtldBoes6hKWzXmMJ/1cQ0luXYwF90NKZgERYW7ESNtFLIPusLRrTSclnvhHztSx
	yc4/i3JNoAOORlD4Xdv7vmxHp40FZ7HnTPrzX/P61itf1E4c/Ifceee+gX9NckRCYTUErxgI2ot
	mTZOF45Nq3wgrrFW+hcg7WHbI8tuu8ciJ+4HD8zGFqMPtxBDnotUJvYqglp3YLonEoDVKiTTHUW
	vUk5xBuRfAG69xklR
X-Google-Smtp-Source: AGHT+IF8BZfuMlR0I4UhcY+twi707ASM1jIu26Ox3FiBZVWC+9NELO/GMcq+/aY7ed5K6qwH9wmwZA==
X-Received: by 2002:a05:6a20:a127:b0:262:d265:a3c with SMTP id adf61e73a8af0-29270bb8175mr14565470637.32.1758477548013;
        Sun, 21 Sep 2025 10:59:08 -0700 (PDT)
Received: from 166871acc15a ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f0d3aad09sm6391241b3a.17.2025.09.21.10.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 10:59:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIGNsay9jbGstbmV4dDogKGJ1aWxkKSDigJhtdGtfcGxsX3Jv?=
 =?utf-8?b?dW5kX3JhdGXigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbik7?=
 =?utf-8?b?IGRpZCB5b3UgLi4u?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-clk@vger.kernel.org, sboyd@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sun, 21 Sep 2025 17:59:06 -0000
Message-ID: <175847754602.596.4377149237007455593@166871acc15a>





Hello,

New build issue found on clk/clk-next:

---
 ‘mtk_pll_round_rate’ undeclared here (not in a function); did you mean ‘mtk_pll_set_rate’? in drivers/clk/mediatek/clk-pll.o (drivers/clk/mediatek/clk-pll.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:afc0006297410bb1a7b44c41e62de7d5a9671f84
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
- commit HEAD:  146bd480c1bbe9d01e77b3a97e256212a12d2a48



Log excerpt:
=====================================================
drivers/clk/mediatek/clk-pll.c:320:27: error: ‘mtk_pll_round_rate’ undeclared here (not in a function); did you mean ‘mtk_pll_set_rate’?
  320 |         .round_rate     = mtk_pll_round_rate,
      |                           ^~~~~~~~~~~~~~~~~~
      |                           mtk_pll_set_rate

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.6/arm64/chromiumos-mediatek.flavour.config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d039df75b320799d353b06

## defconfig+arm64-chromebook+CONFIG_CPU_BIG_ENDIAN=y+debug+kselftest+tinyconfig on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d039d975b320799d353afd

## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d039d475b320799d353af7

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d039d775b320799d353afa

## defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d039dd75b320799d353b03

## defconfig+lab-setup+kselftest on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d039d275b320799d353af4

## multi_v7_defconfig on (arm):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68d039c975b320799d353ae8


#kernelci issue maestro:afc0006297410bb1a7b44c41e62de7d5a9671f84

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
