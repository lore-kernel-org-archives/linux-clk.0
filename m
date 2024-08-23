Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F6549650
	for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398975; cv=none; b=ooHAL6vNeg0s2VY5pkaIgwfzsX2JE1wnFwMdfzwc3Cvp+jNB2OZ1f9W+qZ8CS7HehoKl0wLstWaTexVEtalqEWJHSyAtK/W3WJJBBIjA7q5wSZEXMQT++jk9qajATD1VFJvEKBvUTYl2x25EIylx/ffcnwzF3NZ8F+pQHjcY+V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398975; c=relaxed/simple;
	bh=Dfs/zfxcGMkwxgbZd+pHVglQP7ao1LGjN3pZC7mWY5U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X/CoLp0lkM7XeHOq7spA1E5teicdXgRl61bnjnHe58zVTskxJdWGBe0B4LiWm6NO8uWC/Ed3uUZnXqMgp/xCTqpkpeaFln8uK3YNXmnl+mtI3VTANhh7SNA3royBdRDjibQUUUwwxD59Ho4uRyyQiYfA/hnWKJXfd3OidLChQZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZIky/JPq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZIky/JPq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-371a939dab9so251552f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724398972; x=1725003772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqJUdS/YXG5oCOC6ILbFIKEZvCWARj8PtvC4FGtqr8A=;
        b=ZIky/JPqCdOJdyH9MqTB8l9IgLjr2pBZFbb9fDh/Ql7U5N9C78ZpFyqp61oFSILvGR
         QEM2uS7DLu/TPJLcnNpREc+BHf1pTrNFbK4pYJsrpkyriBxXfmPUtU+uDSF9B+llYpNu
         iNiGD6JTVaUx1uZOubXJKf3jbwlFJ7SWEvRs0MktEB8uJgkhf+iy09iFoptkz1rQPjA5
         XUyKwqxQgo7bCEDWMoyvGs/OhlTAU+2DHFF7azZqPK9uP4Tj7NMDwjV89HPl500nBVaz
         u0/IwWZaMlYQnwX/sEi7t7gSkhtys0SZipBO2Xw6FM6gJs5hwum8kjubbUMG1pSPfcLa
         U7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724398972; x=1725003772;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqJUdS/YXG5oCOC6ILbFIKEZvCWARj8PtvC4FGtqr8A=;
        b=YOqApmcPv6z7AajObVU1QGtpGZcZce+ReFIO+HyoZC04gOdMJmzioT0wKkWiiwcZr7
         th0+tup9ecjMTk3jrxDn+qUukLQQ7TZyr3IwT65jQ1eNO3Ps9YSRXOc3K3EaCMZ+kXB8
         i7alQ3iyffAsB6MmgfaTTkWMGCd0XBs9aZMGOHO9zkMM2Ni62plV22bxFcrkC1FcPASM
         5SG8X9GEq79XqcVlwbPoPJ/xNZ2Db+aURif6WkoX6pG9MmOBKiTBQN9Fsx9TTTfoxEls
         qTl71SArVXh0GlDc6Fo9RshlKuV7fEAf/cLyNoTEOa0VpKLAqpG8EBJte8FUGQlCDsFp
         f5Kw==
X-Forwarded-Encrypted: i=1; AJvYcCW1D+FvWXhaUhoqxi8mtwXyvIY31+QnrCJmxTqrmjI4VejXrcl2tQesrFRnf2VcxffczOrjoUbRiBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGpj2RYKrLawsqqXzR2YhclcECUQK08woX4IUPL9jTUqZhzRGh
	5UBECtHAy75SJvXcuFMrN4QsMost5mWGZbfQHXyQCkDAvdAJTzYQQYu5PHiOVUw=
X-Google-Smtp-Source: AGHT+IHPO9pzchQq/4wYPhxpZn2P65ewO77zYxT1lc5yBLDSswOdkRIe+0dRiChQLRf5edZYQVcqDQ==
X-Received: by 2002:a5d:59a9:0:b0:371:8d07:f84b with SMTP id ffacd0b85a97d-3731191519cmr555784f8f.7.1724398971726;
        Fri, 23 Aug 2024 00:42:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ff63esm3485541f8f.87.2024.08.23.00.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 00:42:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240821232652.1077701-3-sunyeal.hong@samsung.com>
References: <20240821232652.1077701-1-sunyeal.hong@samsung.com>
 <CGME20240821232656epcas2p2fa72bd9565570c26616aaa640d75eef3@epcas2p2.samsung.com>
 <20240821232652.1077701-3-sunyeal.hong@samsung.com>
Subject: Re: (subset) [PATCH v9 2/4] arm64: dts: exynos: add initial CMU
 clock nodes in ExynosAuto v920
Message-Id: <172439897024.16898.14647845127210005969.b4-ty@linaro.org>
Date: Fri, 23 Aug 2024 09:42:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Thu, 22 Aug 2024 08:26:50 +0900, Sunyeal Hong wrote:
> Add cmu_top, cmu_peric0 clock nodes and
> switch USI clocks instead of dummy fixed-rate-clock.
> 
> 

Applied, thanks!

[2/4] arm64: dts: exynos: add initial CMU clock nodes in ExynosAuto v920
      https://git.kernel.org/krzk/linux/c/4d06000979cda26e914552d486e5364248025fcd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

