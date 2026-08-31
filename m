Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E620D2D1913
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 12:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180271; cv=none; b=en1y0pkTwYV4h1AgpGdza90pXvgcXPRjzpq9zKVSEWn2dWPFgytI4wCCd8AYdiazzgZMOnumsivZz6BeEoW2pcluPdTm3GLMn4PJW3ZTKhfwCp+V9IcHS8Fn4zpGxpw2bIAndPD2On63gcsG2TbqsIX4j2LTs4RhmKLtMlK34FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180271; c=relaxed/simple;
	bh=7HB0tI9NIRpPaUJbPQ44ZN9ASqtq45zwjf4jk+Gxa1U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VNuBVMX/HOjbm5Wig1eAf83N8gY1gxQv7rCRLTb+mx28l2sxsOvo7GwDfm7bdJePKaGwLSoG/er5bmsZQT04zM9+gdMY5VKS9mTIFk4jUkwLFQZ/a02q8r8u4iPu2sYlTpMzVCSLl263s5cFRzbjxbEQ43beZfkU/+OinoF/f+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hg20JLr1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hg20JLr1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso27729215e9.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 05:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788180264; x=1788785064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yATNQWjrgyQ5QTRyqyuJy6Nu7sY180z8rTxRl7hDff8=;
        b=Hg20JLr1pCphjL1QOufaM6Em8RiNwese+uuFMXzT6HjNmAX3XPx1PX7bwsZNM5abwd
         4+vSgJVK+IByRpT1WqkfWfmVSqlDTdqdTlby5d6wuN3ijg+Bji4mHXHIuvB0CKC1IP3+
         3iNXGYTiiwMEHKtDQfTisrmC0ALxkT7LNmL4kjrMT+IOI8Mtznv67ANh1edGWQJYjNhX
         72AZxPteEtmRH9OF8mBz64Px+yr3FNiV1Mp2wSno1bikepE4bJ/pKeB8WzT11JNtLM6r
         uXUsfzl3PTMBjf4J97gA8l3bzIzeqpnNBXy0vtLQ5s4TsiCWhFm6K3cOGcSKbm1FgjPD
         waUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180264; x=1788785064;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yATNQWjrgyQ5QTRyqyuJy6Nu7sY180z8rTxRl7hDff8=;
        b=TBokSXocrrDMYG/n4RWPY8HLnAZn563PbmD9otw0lhibDWBVLUaJRhGenN7L6Lmdgf
         1cD3x8LId8dYla/FVg1e4Hnt77PbGaJ9aTJI9X/UFj8pYHTE4kqg/pwrE/5ZGLP2AepA
         bjeVsm0nBoFo0IA9Y8P8JI+k3Nbq9K/mIvPLCmw9a2KzhNRqU2m6iKNE4p+qMmT+7+ZL
         /bQ2I1YfoNuJ8TkcxqddJHATIjslaG7HFrsUxdnLxJiChg1JNIrRUARJ3/vkS0eCMWEt
         hmsq5io3/upFHyaL8PsopUdNE/HT6KzO7NKI5JNWCdNpRP4T5zeWii4fKnIx3NzYW3Ia
         NuHA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6+1ixc0cVeSkHavjTuEShJHBKro2zo8tcRVaQTzf8F+UxQ0183Z40jxsPKkVRAh90iFPDC3b2n5g=@vger.kernel.org
X-Gm-Message-State: AFuF++nGtaY2VatLhcR8OdkWZNq4wETHLK+Z/cCSPfi7l31+Bb/WLtI1
	Ww4t0KqkeQSEmWVq5D1bpd2Alvm8Svxbu1zxLeToFHR22a5m1HhTltsdtXh7rUpS+KQ=
X-Gm-Gg: AR+sD10sXPUdxpErY2qHsL3BxHeN9gmJcvQyLtffhxfz8mFjHfHQ5FQ1PSUfSEnEdsP
	OIT4yjKZFc7R9Scr0jdGoPoLhDdxs3xSIZHm9yHUIIXWwd+p70rTBJamADVxfclyOziTOAljW2v
	yY/bl8V8pbLXsZ95bSonGsYOJd87//Pzqc4qaypd7E1GX7vt1QNJYpNFU3HoTgkpOnf43BvxtUc
	pbhA+4xoCO+XZ+YzwOoveQV7xAR6b4N3PQIZS0MH9iaXNtX1hA7jZb+0UdJyD4S1gOpEoKYef7M
	CybWT8zItLzbphcXcTnsQB4ucB5czFw9qIiVpfOvwAaJ2Bx5hbBKpK/KwDy5CA6ujoxcKpvfdK4
	XzwFjXmchbKOBxGoaQYdH0qdwcTRKsRAKiWj733VeAX678bfZbx1DSFzxo/I21bNKzREWEO30Ra
	4mcD2vKe5xkF40rjlCiUEMaAjH3xgC4IuP8cNijM2h0/u2QCj/xhz3nvEshPdIhuqnGI2L7UnWo
	bM5LfbSOw==
X-Received: by 2002:a05:600c:870f:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49cd538cb5fmr140459815e9.3.1788180263680;
        Mon, 31 Aug 2026 05:44:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm390196485e9.12.2026.08.31.05.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:44:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Lucas Tanure <tanure@linux.com>
Cc: Jian Hu <jian.hu@amlogic.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Brian Masney <bmasney@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4
 supplies and keep the fabric clocks running
Message-Id: <178818026093.2318126.3676223463693214854.b4-ty@b4>
Date: Mon, 31 Aug 2026 14:44:20 +0200
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

On Sat, 29 Aug 2026 10:47:54 +0100, Lucas Tanure wrote:
> The Khadas VIM4 has needed clk_ignore_unused to boot reliably. Without it
> the board hangs at random, loses storage and corrupts memory, and the
> failures move around from boot to boot.
> 
> Six of the SoC's PWM outputs drive the board's voltage regulators: the
> always-on domain, both CPU clusters, the GPU, the NPU and the DRAM. None
> of them were described, so Linux saw the outputs as unused and switched
> them off about a second into boot. The regulators then drifted away from
> the levels the bootloader had set, which is where the corruption and the
> random hangs came from.
> Thanks to Chuan Liu from Amlogic for helping me indetify which clocks are
> critical.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/fixes)

[2/4] arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
      https://git.kernel.org/amlogic/c/ae7be5c58a819259e5eb98a3abfa60842478f2ae
[3/4] arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
      https://git.kernel.org/amlogic/c/1e5a53bd16ac501e68463e84023d1bff543cc696
[4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
      https://git.kernel.org/amlogic/c/406292fd75f95aa3010fec95b5beb5a8b7e3ba3a

These changes has been applied on the intermediate git tree [1].

The v7.3/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

