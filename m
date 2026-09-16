Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8884C6EFC
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789553084; cv=none; b=baZoFmeBH5gjs3WOHmgaIfIiiE1ElqvYMOILiqgecAZ6RAuH8F0Oy6yy9neiijsdANrOGelAH/rMM8pHF1T4S4UAgEAD4GCYfg3paCOux2xnBvk03EeCANOsi3tJZyMYnx23TP9RzT8wTWZbsbyk8tAeOIZxWIRYOe4F694iNhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789553084; c=relaxed/simple;
	bh=0xWacLHVFg8yDFBVQgT0xxVbDKKkqpluoE/q6wHsbhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uahXv2C6LyPZGs8vBcjRubr1EG0UMsDvPk0WhzFP9F3yNf/IBZwJWLqaD2wi3KmsKurire4WTdslI/ox6q7WZ4dpVw5gad/Hr7aLkw/sA/bUkrOosMSe9kOCwwaJSdsSUs/yQIcKIQ1TffdlbLW8Hsgu/sSZkaXg7NCk7ISbgIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rz7f5OMs; arc=none smtp.client-ip=74.125.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rz7f5OMs"
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so379450f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789553061; x=1790157861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+LP4xptQa+2C+BD1oGDKA67ZCLFNM3ainCw+VzoD2s=;
        b=rz7f5OMs2TdV8OQaCPcRnBg32hKNobVW3fGBmuPOw5RGP5Bzc/i2qrzkE3s+9yMCpa
         SYOVguZAiA87Qk5mfbMgld2b42Go3u8LRCZCRubshh8DJY3+apqQfZKSGbQ3XvkpczCs
         uq2IxYooCj3QLScMeu99AiASBhXLEgWlVBv7ti6VIpJjm+uOWZa5zSbDeHsqTPcoCsRS
         e/0R5IR1RLHYczJnUmg2S/pUc4fNxe6Y9KN0Vahkb6wRTnU7+7TCGMRO5Wd0U/rPVtaQ
         Hp82EGeFYJmyeN9gunejD+vzsHEyd9S8WUXZRY+tj2HQ7X1sH3ixCguO2fuAct0Be6o9
         nFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553061; x=1790157861;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+LP4xptQa+2C+BD1oGDKA67ZCLFNM3ainCw+VzoD2s=;
        b=JQr+fPUoUNEtTt6oyjWoAMZieLg39+nSmXu1SM8Fge46nYnxlfP6MDZq8pwoQiloUs
         XqYCBxJmuWx8q/jxEgd9fxZgFzfTWAK7B7T+3WLKqrEUZYOtAM7mrFeiehit5tKsu5a/
         g+T2hbMl9cOzHujqY5kN10luCCWAUvUUvosl/IOUC+tTT/ydHeiyB/QrepHhXHcPGroq
         gDBSC7B5WTiKSQnoKVoCr6SRjiq01MNIMnboqYH3EibJfkVwZuRpkIwV4OPNqiBNQOnc
         C5ixbK5TX5yMulehh9UIUrtVkiqQYO3XKGTSVQ6eJm8Q9FMxTh1IqlQSJ8dyZPUt2Taj
         VghQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6FshmUOkrDdyokLJcuz8+CSRG3Y0758L7JEidpFODeD7ateqt6Q7LfyfggMdM+KWvVMrCU4ZmdRk=@vger.kernel.org
X-Gm-Message-State: AFuF++lObL96FDgFUID/JgHEFwxPj3DdxulibizQBrhfjN95bLxY29RJ
	vKacXrKFqCU0niFDXxPp6K3iFM2UecWHJECXvpQpy+S7ggLalkurMjCIrAzI+Vv5o+U=
X-Gm-Gg: AYBFou0qB03qpdAaQr4LQwxVfvvLTctazd4lI+EE4RVuXgLgxQu6dHmhm2MvI7sc7uM
	aemWqLTEVg3WY5oNQE+eldInsBjQB24HaIQ+9DlITzbBCDvM4tCmiefd2qAeKMh2XnhO1LQ7HLx
	/w5zDTl4Hg8Fv5hZoC9Fhr1bevwIKxb92iDOu25wpMrGYa0WvxGywYDURdBQA7K2tNk6uQEuc2h
	CD0h18InQBa05+G/hIh/q2HWJgTyfwxdaujM/ZTpZpqAXiygExGCZyuyQSxVH/0WU6XDM4hQgpz
	7u/sA70Uyl+USURRcs25RZh1c79hK0+4EiDwxX76Xax329B8zKd1WUsvW5fp/KVsbU3ZgEsrtKH
	fYEkOC6vRnxQajccYJCf6C+0rmyGlwGpNMI+AUMBuaePThnSSXalddACdpW+y9vKcRhhDLhmrs7
	5LqW1OzA8vNmhMSx6NxmTJVtP8WuA42FlA0V3dS24TLTPvJib7Y3BbAqc0CkLxX6DKsjICkm0Ab
	FOTI4LDC55e
X-Received: by 2002:a05:600c:3584:b0:49c:ee36:10fc with SMTP id 5b1f17b1804b1-49eac4678b6mr26145655e9.8.1789553057754;
        Wed, 16 Sep 2026 03:04:17 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e84805db6sm35844635e9.3.2026.09.16.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:04:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lucas Tanure <tanure@linux.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Subject: Re: (subset) [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline
 clock real consumers
Message-Id: <178955305678.2918771.10810230842213506975.b4-ty@b4>
Date: Wed, 16 Sep 2026 12:04:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Sat, 05 Sep 2026 16:32:30 +0100, Lucas Tanure wrote:
> The previous series for the intermittent boot hangs on the VIM4
> marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
> explained, sys_ampipe_nand clocks a pipeline stage that the
> hardware design inserts in the bus path between the SD/eMMC
> controllers and the NIC_MATRIX fabric to help timing closure.
> 
> So the clock has real consumers: reference it from the three MMC
> controller nodes and drop CLK_IS_CRITICAL instead.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
      https://git.kernel.org/amlogic/c/065957517880dc7053e0723cc9532b6e78c8855c

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

