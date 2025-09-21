Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB06274B5A
	for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 17:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758477549; cv=none; b=YsRNZjy+Fs4euhtf5LttdPTLXo+LQdzqcQ1pmq8nTz5ds9lMy/hOUlvieHCJXWGPAZc5uraim8dcuhsq4X/DaJ+hXRFaO3JbSU/AOlhb7Pi702vjFWV02NctQPyK4m3RW9Tm5+4MlpHSeoYglZoPNxVe+YU0jouw8nKE1N2kFuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758477549; c=relaxed/simple;
	bh=csrhZLgRqk0LyBv6H0m3QtRbPDuuNLS5kbPoTGl6p+k=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=G6cOVFg11n+DTdwmw9s3YCWr1Wo/kdCTRRN/LBKIl3Wwi+cyUkWcEpGAoBEz559/jKcWLKP1M6Az6p133qtvj81zSlApfb6dolXiSBNzWPB6JwnDXfNcRdSijxtAOWOse1F6D3zJhyN7iY0dltDWAnVNKC+97ChXvwcLn9Ja0lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qMHAlNbb; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qMHAlNbb"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3306eb96da1so2295558a91.1
        for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 10:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758477547; x=1759082347; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XizHke7K2MtvztyRNpSVD9+knHSzRe7eGtjqBPmYl0=;
        b=qMHAlNbbTz5LYvaSrJSJExTmwrQY3bEzXY+LoLrIFoMkVKOW0U4zVUk+ZF7VULxSNc
         7Ym2BzsF1qfy4X06HS9LCSKWavBeo708QcOBo1hJbsXLDUFHWFiWllL36E1BH5ZHBsrU
         xmV/AN1J0RDs9lkaNIIIFfHGqUZ1646GB2pAOwT4VVmxZ2AX8lk5VunE0fW9vvWMMbJS
         ZDUXxLftb9mpRY5aRz8rju2tiKmlPOEX3msELLuu4fIE0r5x1TCXu26/BNzgEjyjxWGU
         qY6OTsTCr2mJuxKMzkechDF98yXmtqB8iQzpoD7ncKhTSkfHVDg9/AQmiAOIlwN3DUUs
         j9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758477547; x=1759082347;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6XizHke7K2MtvztyRNpSVD9+knHSzRe7eGtjqBPmYl0=;
        b=S/LdEqYA5WBMdpg6esUc64xsIHTnAI7ZgCEgFU4XssBsVcyOqSilnpZ7KBK66NbtjE
         4BKKiLSRXLyr1xil+Ng37zeFXP2px8aFzCoRKGrmb7wTsfTJgnCXFdJcmME3lVdCjhsf
         Lv5QmiymI2CEnJsP2i5+D0S/7262SwSgTtgxYEZEeo0br40s1O8ke1B92C8sZTZKEyLm
         /kVVAqwWOPNbpp3k37776dShoUB/4QtVCzqElsolqfAvUCVjrb/m9vDu9Sec7/WVjg84
         zFeaAKSc/ZF1Erfdr/XT6fGxNND3m4byrqwHtCboQPjZ0ApFt6ITgwGU2852SUive4Ng
         PIPA==
X-Forwarded-Encrypted: i=1; AJvYcCXF0gi3Cz+wzmUkXTbPFXTPv4zKLN6H+4SNEA81Ua2eB0v8ME5gLFsAqwlP1TRWNqfwViZU+QyVgnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAV3ofa7ILygIZfTmIt/qUMQMFP33ua/fCDKNWQ9xa4j3wfgPy
	1ddkzFB9N9tm6l/uMVXg+SxdDDWFXxrQqngpDKG2r2B7XFkm0AVAg9K/A7dBEFkWtYk=
X-Gm-Gg: ASbGnctfWIRoXfw/r00KVVI2MviAOmj5ORKNk6NkfBCtm+hlSEgbJtzwoAQ9H17LR1r
	4ZMXY6qCg2tk7giAQoZdaI1HpV7+UVigBftFDndvVcSqIByXyBgiVxsda1B/q4ehPp9GITmgYJ6
	D+QPBIS8BHR0zYO6p633B5RFSesa2rAlLblGm5oxOnF7wAbfEjWE15DvL/LnRYZvzW8pDvJeP0p
	ETdQphs6RQ1wflDYL1oIuwXfHfkLe9muELY11qbZdltyfvujzSmiSZHXrBWCXIFIMYYLGB8ptk4
	Jm4dFmuQTMLiKR5edoJBcc9dlJJaVbcoNoWmeSojYOVhTXhYnRYNaI2aIVs1xTlX2ZU9nRsKHx5
	BodmXqQEzoQ0Qzy/g
X-Google-Smtp-Source: AGHT+IEaIUcg68S0KE2ZLQOfbyGk3xRoXSADGWAEtaR03YX8wvWYwsR4Kl5t59SaVu0aArL9bQkx3g==
X-Received: by 2002:a17:90b:2b4e:b0:32e:8931:b59c with SMTP id 98e67ed59e1d1-3309836e539mr12344266a91.27.1758477547370;
        Sun, 21 Sep 2025 10:59:07 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed26857a0sm13963828a91.2.2025.09.21.10.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 10:59:06 -0700 (PDT)
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
Date: Sun, 21 Sep 2025 17:59:05 -0000
Message-ID: <175847754545.744.17255394538264123187@1dfac204f25d>





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
