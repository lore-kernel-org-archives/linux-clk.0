Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8BA385513
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775636426; cv=none; b=crvah9ceUtsm3QUfwfQwZjwcoMPEpRxkZj0QBeeU5yddQuuzQVDQCdxqwGVlSaBQrEHxVnnaufaRiSyrncdY6hD85yLld2+o8az1+QAX5vIWc8I+taKPqr2ssDhDf/M9SU1Qsqdp+lAhpjObgtVeweYx2y7B38zMYkLLODkFvV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775636426; c=relaxed/simple;
	bh=gtZfbxKRElMEZn8O6b4BlJRIdwl5gp/hWHEN0k3wwbw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fWGZdHE8qcdDLQeExvH7k102rjVaciNjuDq39Y87m2YzjnhPUC0IvCbr+GfLih16QSvbhuB5GjDs7hARUqHALB1fr7dmjdRvemboNfYy4pMR5CojN1fI1aj4g5bEv2yzV6+7yUtOvdIKs/cKv1bAIMUf0H/drkdy/haiAhM/lyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=z8esgjH+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="z8esgjH+"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfb723698so5111302f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 01:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775636421; x=1776241221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRd+Civy+geLALzWFHgxsIesA9wBU9+u1x5Mut66okY=;
        b=z8esgjH+Gh3qIJaW05xkOEePSjAm895g8ZL0T4OekOPmHQwVIx7D5hlTSApfkA5R4b
         SsfmdI7dXVi91x/7Icu1VaPCz9OrOhGZPjSkpNyxJ7rpgx/Inx/zT5m3PPOGYUyWqGgo
         oI99geuB50ZWhKb9Kevjr01KFpg+wBeONiWSpJu8GsJsI086DVENyomGubXUf98OOzYz
         QL4NPRd7u4LToomxEAq9AjEynX/ZsxMFVLuM38ZpovMaND+d8Unj1vSCgAQgbgYtZIec
         /ICSB4tAbjEsYVjyp/FFT1lkFvzKgPPEiX7HGHCgIezp7v4zldFOEiHxZEy1g9Lswav4
         FSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775636421; x=1776241221;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VRd+Civy+geLALzWFHgxsIesA9wBU9+u1x5Mut66okY=;
        b=hGqk8XtsHBvkqdhetfy5qizCO3kGMDQPZYW1+7CCYuV5Mt5UYyXDTXI4GOzrYGbbNS
         Fyjbur86GjPt4jTPw36+/pA9IqBDEQwCgfDY8lZMmTStZ0UMaIvCIy7WgFe3K2VNQ4Mp
         2Q2PWzW8hg3nsjDJlzXkWFSaZFDLU9ZKIbnTB7obGERlZmGjs2KS9KJv2knI7bg9Z4Uz
         C5ieyv9ybrFG9jRQjEjH8KzL3csmIJbsrHSb5ycedn+06DPOdcInAk0fjVzbcYT05Ziq
         lzktA6qBa7a9SzFCO4HsgoYwp7qAYNNU8pPUyK+TD+qTQ+z6cGSBdgwt30n63RDUMlIa
         IpjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSom8+JHjmtVvvgMvQFYskW+KbklLr/MBNRPBN2dcSOeSxw7PFvpKfAh6P4ZHdyxwHX/+WFqNALQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTaGy0beEAFgW78EzOqbfHRi1I6GVOO3UyLczqbEVqaLSj8dOs
	462D7IL/2Rzgl8o/8xBAz/cNxS/1FN+QIBDLe8OE9PqGnmZqKhCr4QNCK3n6/uhbcyg=
X-Gm-Gg: AeBDies6KQod9v9ZOGOES9H4DClw3ODYWNOoAMamCRQMzzjlFCv/fpYNXXyffCCMkBw
	EhBAmRxuDijcTyTohBWsWDk4t2sYTyTw362hbALOCN3BltDaej5ypQdlTf8zkd4mouFcndWUUJJ
	1XVLMtlI3K5RTH0nliF31dyyBpWXD+FNgFQ2kM2casYHPNiFtPd2ene9FRKofLE4guBAAqYRmfC
	O4OGjOmFQqaQ6HLEhx4yvWEgO0eXwZLbNG5+gOuLl9JVd18hL+n9cmNkysaksQ6Iqr84a3qcVb5
	NFbnxuyQ34fqwDyFj3FzXHhT1B1ubZaoExrnS3xX8kCz8I0aavOF71Vfw0NLCVWJKx3XhgoPyZz
	a+YEPeUdZhxBW1F/4+SMzIOy7kPysx8gd+78K8fdmLe6YeY9Iw0306J/ToVq49Z7LlgWAMrLOTK
	86hOBH2qV4IbAZf5bNjgX5+g==
X-Received: by 2002:a05:6000:18a9:b0:43c:f90b:5663 with SMTP id ffacd0b85a97d-43d292d4753mr27905582f8f.37.1775636420996;
        Wed, 08 Apr 2026 01:20:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6715:3376:7379:78d8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43d1e2a6f1esm54494851f8f.2.2026.04.08.01.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 01:20:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
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
Message-Id: <177563641892.1659838.16115307647051827681.b4-ty@b4>
Date: Wed, 08 Apr 2026 10:20:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Applied to clk-meson (clk-meson-next), thanks!

[1/3] dt-bindings: clock: amlogic: Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
      https://github.com/BayLibre/clk-meson/commit/6d6be1cca2c9
[2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock
      https://github.com/BayLibre/clk-meson/commit/87edca62c4f5

Best regards,
--
Jerome

