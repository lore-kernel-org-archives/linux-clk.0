Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE99120485B
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 08:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755506855; cv=none; b=qnLkPYex1t5iHRIwW8/0he3/m/zEfW70sffiC5eKhEYqWYazCSC8ze4B/dyfvgg3JL33YOniatjceA5tpolUIiHw8O6EehGKCFfiVea0k0CRzRHKgkgIKoBZUnqu9kY7BiqvHUK3fk8cJtxkBnd6qtgTlRk5MYZHmbSCdX0Cz7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755506855; c=relaxed/simple;
	bh=BFqb772XKvnkGz/X/GiHYC9tY0Kc1FlOx29S2g2BP6k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n1pBQBoYdQxKR+KN5vbLC0aJZlk8quOozeltTRv3ESaciSVxlc42sr8RnRbbmSs/+VufMugZWArZkQyvyTQP6CEd+NTgpZWnx1x5ACf4W1R9ZStbpQmOxqKrJbCjL6f3VIrSaJ26BK06I25ySLzbSc0iSluKBfBHLPIJ5rM53FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwUdK/5n; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwUdK/5n"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6188b761d74so687837a12.3
        for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 01:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755506851; x=1756111651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeuayamteocopIdawkFz8GBgWsuO6jcTjJdO7tqQ9I0=;
        b=JwUdK/5nUdkGf0zbwUKOLs+S0/DASbi0UqaDUkEU3nwHR+Ki8Z8Jfsv7aJy0kJ0ABx
         5xaFtRBJpyIdqZthpPCUnb+I5wVK+kQR8UgrdDAt756aGl5ruv44ArgHOKGcjHyhZ74w
         IvkSP2pKgTk3a2OofaEF3+HKt0zyjgCZSKW9FIpQTXEVFTZv3bPE2VerVme+5wX5hEJ8
         3wjbr2HascFvi2Fau6qL+OZiOiSCRVegWe+cWc60BNs5CPSXA5vAwFDPYOyBiW2lRwHp
         NHxR5cvdwiKAgfn8rZ4SZ7CfEy8DC4NKuYDDEWRi2Ke/742SVuw696yP0Fbw40/M8jFq
         XH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506851; x=1756111651;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeuayamteocopIdawkFz8GBgWsuO6jcTjJdO7tqQ9I0=;
        b=Zs/1Fkju5cqvh6Npcr6ol742HyOlf96rjJCoH9ZvxgzJhcsrlR9+mjCZYRLydZ2jui
         3+L1j5SX4jx0GTnvgwbHodsntH7T2yVsqt9tS7d64LsUp3Y/GcijFbsvuzm9KFrR44th
         /3uStyJjmNAt0V2mtRnvpAEzkYSj4cKYRzuB/GT2VJKHs4A84I+ABRuvmfgv2y5OG/Dd
         0y4SvnfQMetk1eQViAeWs0AJ+eVKVyBFuDkRQHVWQpuQ7QoBeMW+fXiavDEqqIGVSTt2
         epmO3P2ibraAl0tSL7GcQYnXcp05SPmc6AQY/3g1hX0z5f/dzfOxua/h1OxDiUoRHKn+
         iISA==
X-Gm-Message-State: AOJu0YxXv/NC0wpsEspLZF2iqL4glPcDXjs6L5Ra8glEQhW6YxQWFI47
	5Uh83wgJeONJUZGwB6QIM+ZUVTP0DffUhxu35gKpMW5zO9ba0zc7djsctQjSGDcrdGM40c3EKmG
	6hcT2
X-Gm-Gg: ASbGnctvgwP24xOuzwkj4NJwGx8l01hd+nakp1ScH6YxNZJ1pl5qOm0c3ZAX7kQsBk4
	33dSI1UKDAkloO+yF71h2Oif+8WXhup264VdtVfNsHKOIx3bISKdUEfHJ1Vw7wBQ5aGVWWJlOIj
	8veZmiz2C/MNA4jGzslJSHTeKanUGekuzNUjR3P6YTleWjeKsIANNQA/rUJL1ZMdD1ShPAZAD2K
	7q2VQ/dSlWpVwVLgIn7HK3DDIXvhqEXPLb1luJ5Ip7NCHrxbHI+8lHL6rYjMEZKc92Gxt+coW7F
	9CW96q1X6MDisTuMuqXXHzQE58U4+uOLbzPEndh0/sBwKV6W96qcrUk+ZNzosotTgiUn6FV3mMR
	CKycJGJBAas8/lFQTMI85qruw7jnPqo6pPcIzV0LU8jBN9KEmtg==
X-Google-Smtp-Source: AGHT+IHnFT/QiiX+/jyxr6JrjJHBnX2ZgiTGkz6V56Qs5+zyrhsCVsoAqUSeVCMOf8wng75ASWqViQ==
X-Received: by 2002:a05:6402:440a:b0:617:be23:1111 with SMTP id 4fb4d7f45d1cf-618b0865203mr4787283a12.7.1755506851453;
        Mon, 18 Aug 2025 01:47:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9da68fsm6627647a12.22.2025.08.18.01.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:47:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org, 
 cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, 
 martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org, 
 catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 ravi.patel@samsung.com, Inbaraj E <inbaraj.e@samsung.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de, 
 festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250814140943.22531-2-inbaraj.e@samsung.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141003epcas5p167e0a3d0ecc52fd8af17151cdddd031a@epcas5p1.samsung.com>
 <20250814140943.22531-2-inbaraj.e@samsung.com>
Subject: Re: (subset) [PATCH v2 01/12] dt-bindings: clock: Add CAM_CSI
 clock macro for FSD
Message-Id: <175550684881.11777.14718777449068060989.b4-ty@linaro.org>
Date: Mon, 18 Aug 2025 10:47:28 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 14 Aug 2025 19:39:32 +0530, Inbaraj E wrote:
> CAM_CSI block has ACLK, PCLK and PLL clocks. PCLK id is already
> assigned. To use PCLK and PLL clock in driver add id macro for CAM_CSI_PLL
> and CAM_CSI_PCLK.
> 
> 

Applied, thanks!

[01/12] dt-bindings: clock: Add CAM_CSI clock macro for FSD
        https://git.kernel.org/krzk/linux/c/5576d8098052952a6c95af86ad3dcb341554ac75

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

