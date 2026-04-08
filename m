Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89A6363C61
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 09:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639396; cv=none; b=UQ4Tkcm7tySCMhnZk0LVJJpotqIcU30xUF6zb7WOsPHmTsJw9pA9Lv4ic9ybl2/hj2VditeE1/Pnveh8LqJUop7918Nw4x7/DMg4iZzwuRRtb5k/yeewr+3UG0IAX8vUKjqfgzKTD3jpxeBduRyNnX7YgU2isEGPIt/6+MmILt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639396; c=relaxed/simple;
	bh=4eUF6wOx7oLK5u/LP/Ubs7d9j73K0COWAjVT9tml6LY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SQkA70Qp3yXFJc/NYNbio3yR5ZVBdnRSqxdW1U4QRqD2dJVc3sl7FPkkPvwZyfGOh1PK5VPr3jLfjfWdxqqst7AizhPGsWPj6KZd4YalkxBQdhI7D1qbpW7qvD4kRwq/slDpaVH9bsutBM4VKs39iAZNZG5GVw6OoRZ3DOwDFQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOqmBAg7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOqmBAg7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso3340051f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775639393; x=1776244193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVQ9lyGxSeMxPWxy7ZZTOBzpLHNklj5caAwwtl+7bEs=;
        b=iOqmBAg7v2lKw9IRxg3ZdAFXybbl36t2ojtuWbV12tj0w7mmDjTRRCnADFkrlsvEGd
         AEhNUpSiLtt29Ng+srMGgJb/5WeYBQ6xCY8fFZYT1NPYNiJKTL+/eaQAtN5MKrY7czyC
         UdfApwAUQaUywqvP2RVdVwsrVjQcl47x9Ok2jKbLHOL8shis972+Xez6hkei+G/4d88R
         P0Zo6Ki52rZLCUYUprkvDu0Prs6KytMPW9YgSt/TrCoy2UdJpwqWqNk9TYH8E83BLTVY
         OCD/b9X1YWGSkM/HatmFRseunz9SYsv4mm7+15ftWM9atvkVhN4OofRdlGmrhJ1xgJ8e
         50sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639393; x=1776244193;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BVQ9lyGxSeMxPWxy7ZZTOBzpLHNklj5caAwwtl+7bEs=;
        b=Vh432BHitXf/RDeTYYYC1puXBZr8yfWyabqP19kx7hro2Cn/clMDPenxfL2A40U4la
         yCb0fptlsbpJUICkHmx0ZsA2WDLTDlWeczHDszfTBMkRG3GykdRQsPTjGFKGFYVex7mJ
         Jf10rSaCJ4MXy7pvOV5gYBSLO6oHqvAE0+LTAhbYUjNjlWUbVQjtv7nooMkDyd+lcfpF
         p+IqEBS/oV1D4d2+LR/LE+KC8hZOc48kFST1/ymvIYmgdnUdtXTWBquM0k+rh5vqz3jy
         gxAS7LrmQFJBQ5o/38824rRNNz5O73ryDiTXboyXYba+rXh96HvrpyyIx45nn3WcVHkZ
         qkeA==
X-Forwarded-Encrypted: i=1; AJvYcCXHSgyC1oauX7ODd8uDw/iChNAiDeyXwydKyv3ktGk1mwV9UZ2WJ+PyKZVF7rgmUS80kDLUNvUr2Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5QMsYdgHnf4/Pwt+AjOek5JK6bkfP9xlZOoJIn1T4i9QDQGUW
	fbmdyV+Tx2egP5uPLtMfUxeWO9qgKoG9vnYtrSv0jYzRw+ckxnYCczE2IyB5nua74F4=
X-Gm-Gg: AeBDieteduT3khX0rTWMhS0nz0j4mFPJPEH5UOPFfZND9G6X2wvDxxfmWWpcIC8KW3V
	XEnC3zUQ/1nc0lyDgBtQsmbNmnhIwWYGW06toBFdjddiswHa6XPjEhYcmbTA317DVdLXGwZmR/M
	oBEUyY6nLnNIiS4QNO9kU7MzIXHXieFnI29BpiuZ3f7SmhE8DH5D1f9ZFpNcveQAKMVJWLDYrbo
	KUlwkirdijElDtu7GK30XmlBXjSVAnDnEgumMS5ds/MLxusij5LAOEuTZwgP2Nsbc5urLFpbOpj
	dggkeYXzPjDmHt7oBWSeXLjm22jP9z41bHHgNPzTCY70jcWdcFVfuKrDqcR9CmXgOCzVPTVe5tx
	i1Unm8JYZMDGPKKkzuc+7P8MX+IFkuMVRZ1KYWx4nsE1N+YwDE3olGT7SiP9v4nluQfgL+4xiEU
	YrZUaxfx5nbCMhAHs42X7Z2ej7Ye+jpo6yASQlP4u8JBoG
X-Received: by 2002:a05:6000:1a8d:b0:43b:3be3:9a16 with SMTP id ffacd0b85a97d-43d292e4215mr28461338f8f.38.1775639393127;
        Wed, 08 Apr 2026 02:09:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e1c27sm54424005f8f.26.2026.04.08.02.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:09:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Ferass El Hafidi <funderscore@postmarketos.org>
In-Reply-To: <20260326092645.1053261-1-jian.hu@amlogic.com>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/3] Add the missing mpll3 clock and clock
 controller nodes
Message-Id: <177563939235.3407812.2098744320811836636.b4-ty@linaro.org>
Date: Wed, 08 Apr 2026 11:09:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Thu, 26 Mar 2026 17:26:42 +0800, Jian Hu wrote:
> This series adds the missing mpll3 parent clock and completes the
> Amlogic T7 SoC clock controller DT support.
> 
> - Fix redundant hyphen in for gp1 pll
> - Add the missing mpll3 parent clock definition to t7-peripherals-clkc.yaml
> - Add Amlogic T7 SoC clock controller nodes
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[3/3] arm64: dts: amlogic: t7: Add clock controller nodes
      https://git.kernel.org/amlogic/c/5f727a999f80a72dae7326577e0d832799ddeaa3

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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

