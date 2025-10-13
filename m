Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751A1213E6A
	for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 01:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317324; cv=none; b=qItrXejAF071qiAJN223Btvuz9wOOKcHXRnDf6EM3co2Ld0O0wazUjOMO3AIO+LtZMg17FhCaKvdnG9RR65n1bNgsxHTrE3ObzzTibkpQHm52AVk7M7XYIpukNoBdlI3YEtha5ziE90VFbAOuh30dTIN0lHyIySmym3cqv5M3B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317324; c=relaxed/simple;
	bh=5QsolDiiIg8i4wa9pi0bcArvGbChTBgEPx+xwIk7v7s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rABcEeIcUxANO2mI0PJ2J15JXhLIC4J+lXpxFM3Jl8vre5XHZC5lxv/MhNVlpwV4hrY6ESkQAj6sPJq8b1yIR2A+lHVZkarYEVa1hgUR+wOKWBEOCn4xyjkwOY4JQkQf4grnZku5StVrxI90DatgXIyllVC34ed1BDK1rCsy/mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lgf29vI7; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgf29vI7"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-789b93e9971so286594b3a.1
        for <linux-clk@vger.kernel.org>; Sun, 12 Oct 2025 18:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317323; x=1760922123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2VZD0X6ZKBVyHcu44cQwkRlDd6EuJvxZbXDHRQf7Yk=;
        b=lgf29vI7dDN5ihH75+KrCjSgi/mRIsILTZjpQgEysVUllzni6IGPt1a4I/EkTxvLBw
         pkdLb0E93Ebe/GTOUAjXfXpp/zFcWDDPt1u3qiMteKyK5fQZfXRTVPfBMMM2V5eD6b6D
         DXl2Xj7CgHoPZVv1JLC+KLiNyB79J/O/wMbJaGynyEBUwVxT9fXFG+vfirdusdsNEK5n
         91MzZpD/kA+kFEL/nBax17EL8JlJuJ0IVskrz/7t2yw6HAe3YkSznT8/KA/dkWZVDYQB
         2lu4q/oQeNGMF6a8kuIPsDSLmm6FCcj8KKwQNA1EcHwoXvgt/366HB5XEguVEJhVj2B0
         vkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317323; x=1760922123;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2VZD0X6ZKBVyHcu44cQwkRlDd6EuJvxZbXDHRQf7Yk=;
        b=xHAJCRM0ZST6yZ+h0fXWLuyTInVl8RL0dH0sD+U1EDfmcJZ5a0t7kZqRJSf9Nc77wQ
         4FQUZTPPlSRNHY+zye+9BzdcL1vX9YwBL7r8UzcRb1VAR+mpeGvZtPXeYiwQdRxV3Crn
         V0dKmqU5zKxoUE/jp4DTrLa4S7/mBH/EfFVZkUnNJX0mGsanuhScShsVjISlzLWDz2c5
         FX+EGVDSXHgeOFbQn1B3JYKaOCFuDnYZ1j93SLbpfCtJ03Ba9LZ1OWcaVuHuZu1SOv2T
         aF//Oblso2nF3wZgzuEV4o1iV2DaH5lmnC5YPaH5avZ+VgeWa4MDT/E7hjf4wa0lVFIh
         n0bA==
X-Forwarded-Encrypted: i=1; AJvYcCU3CWDAS24/HpwI2gw0W6/b531YWf79qwF0SGg037vLW0qyd+u2WkrStZpKV+/85+dXgIVXAS/HbQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI0r7JLqWuFBYLoXcJ6rBKCoGMam3Tg55r8HN6spp8uvDZANG1
	dt1OX5BZeMEM4SEotkY3DFTfrn8ZElogxyKVQExM7D2nwbacjcVD6xoJtikt/UqFbjM=
X-Gm-Gg: ASbGncu4lCl6/VBmLr/4AJKs0e4JWCdtDpxHSNrnRImR9Xl0fyoO74FRAv7DE/altGJ
	7ND0yvUhxWauTKr8i9fESI758ptg43vvU9rR03cVvXlEqmBBCPQJxqtgEP53he1l8/bTQ2xaRKW
	a+yL/pL2q2/jl5PZTbuE7D2idZHic/0hxG/6foM/0jcAYrQtTJUPX7PGdMGHB90jSdkudNISdwM
	Djm2xgebwVxGzX3HvnTHjwYXQlnESXWF5nwpb/2g7M/bf/vhy7neu+OOuXsFq4UlMQ5bW+Wc9bX
	CJmfzd0wctaaJKzAHX73yprx2LS9k39oF6Vz+Y44BEo9WZqJODhnJecG/0CYUgmHfoYj0qwvQ/I
	RNU2Q6mLU5gGW9+E35LeW77IExJRpAoZ9DB4d01nVJU8sdpBwtJVuEkpGFtBL
X-Google-Smtp-Source: AGHT+IHkhsD8Q/l6W8s4BND2jDztyLoKb3Ag770eBYI8rhYQWaZ8cr9fIADYoln3Ut5t+SFwMBNglg==
X-Received: by 2002:a05:6a20:cf84:b0:244:aefe:71ef with SMTP id adf61e73a8af0-32da8439bfemr12149595637.6.1760317322630;
        Sun, 12 Oct 2025 18:02:02 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:02:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250925130457.3476803-4-raghav.s@samsung.com>
References: <20250925130457.3476803-1-raghav.s@samsung.com>
 <CGME20250925125624epcas5p1b8da5d2cca89128d286f740b9896c609@epcas5p1.samsung.com>
 <20250925130457.3476803-4-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH 3/3] arm64: dts: exynosautov920: add CMU_MFC
 clock DT nodes
Message-Id: <176031731657.32330.2231798506683118457.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 25 Sep 2025 18:34:57 +0530, Raghav Sharma wrote:
> Add required dt node for CMU_MFC block, which provides
> clocks for MFC IP
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynosautov920: add CMU_MFC clock DT nodes
      https://git.kernel.org/krzk/linux/c/e3be50e829aa1aee713bf0c6907acf13d48be310

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

