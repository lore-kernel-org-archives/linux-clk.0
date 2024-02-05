Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D3E125B3
	for <linux-clk@vger.kernel.org>; Mon,  5 Feb 2024 09:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707124413; cv=none; b=EaGzQWccqY+vbPWsYOXQUPnwXLeWDRIK1xp0gGWYIJXsI3qPh3M4auBZ/t8M3PDKeQeiZ2sPblMBQt+gkqDKA8gbpPayYseMPJYBsIkPGIsZYOkS/CC0tcAy4Fvrzqc6SA3I56fJE41hzIfUGORZ3zXBXK/FjkWy5b9WMiN+RWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707124413; c=relaxed/simple;
	bh=gEzQAfMnaqST1rznq33RwlCpX9G577Bc1r+wGDRRL1k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LnxKBHlkpZVnLHOFqGiKRh+AS8zhn0ei7rVoXwbBa4H0Vb9p8BWnDJ+oHOJq/2Q6XjEGWhG+3FHLd0wASZFHKIjsmnF+aL2357TfRs7s5a/EppIHYsQQANakxo2ZcFaiG00s1o/P3iEpM6aLGhGKK2j/KFoo1mmVF8zK/S/LN9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zxyc86tC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zxyc86tC"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33b1a51743fso3034896f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Feb 2024 01:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707124409; x=1707729209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIlBCGAlAOP/xnINBhUIazc/5EX/rAUDsP4Mt1wIx3c=;
        b=zxyc86tCMLi+jx7I7uDf3CpMB67jpdPdmZgGa7F+Km+z5xJKc711BzD9ejbnBoOF2G
         6ObipWUliSF7rmuI2Iz838oQRS3rWb76S49ZhHC8OvRlWQQlCmva1B3I+9a8jloqTx/s
         gTa/N02UerUrwKyl+ACcISvcG9X1OQQTNlAjgHu264J/JIAnjEEKchrJKo+jykdV5c+d
         d0pQfYx9SuEfW43AViqVtLdX818eH+UawUoqrKHLypLY3NeKCiGL0OyaM5ii8UTfG8t0
         QfYR12UOtZmXF1Bmvism0pq/svfWuzNtPWqG6O+mDNVme2GpDKkC+/0lcftTv4WjDhNh
         C6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707124409; x=1707729209;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIlBCGAlAOP/xnINBhUIazc/5EX/rAUDsP4Mt1wIx3c=;
        b=q/atmVrFszc6Yul8X5PLWaIcqJgRPLrpUQlkBZr6kNdVYGPZwZdcLPS+e1iGCSDYSM
         CZqjKj9kGo54axXfPK88HlnusxzpDzIOdrfeNMc+QqCq2jXtGoNdnUkcSgYLYQq+b8qS
         tE+OgODdeRPmxvJ8OTbEzJgmLwkM4D1GytruMQuSts2BrRk8nQ97TbH0EzXWfMqxZ37d
         Wg0nL2ybXNMn93qDbWQwNd7cVw49/lJ/1r5/hcSEdzTGIvrQqMS913NS18oiDgd1S2Gk
         lvZ0y0gB3K0PMzH9mKuoKs6Oqeg2UCPNea+/ywgaHX90ho08k6LS1QeerdnVp2tYd89x
         TApA==
X-Gm-Message-State: AOJu0Yyc5k3h8VVcW8WHipvNDJU1LnxlCHC1vfz67aTDX/fO8Nli4G59
	Qe7KNjOl9WRS77+UCdupmZrfVXNHvRi6Hcki0uANtPsoZkXhtZG8a/9IgTPwkZw=
X-Google-Smtp-Source: AGHT+IE7cboWWkouWaojklpHcDELlxQ+5B75F5Fr5svEn+rxuGcVzMQrua+ZWs7f/9hdxCV8eGsXUA==
X-Received: by 2002:adf:a399:0:b0:33b:3774:ed0 with SMTP id l25-20020adfa399000000b0033b37740ed0mr2754187wrb.2.1707124409402;
        Mon, 05 Feb 2024 01:13:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXquMu+7rRjRo9xuJDvLq9JoqQf/DoHAKt/zk25ZB+5A+y0DrzSLFNbAAODEmVEe2wvVG/kCkGsEW+etLt+zyd7NU/KhnEXhApgEsNw5tQpDF5T/qWdHIPebgY7gNNvkIXSUMLamc5GeTN5H8KZx5UiyBNC38XBNBYlbA6d+igsDHpHrOndEVmv/+LaGjDyOIpT/k72In8n0Mg+7xnhOSIIwbbj5kLZOkkt82G9mqUeIByZfN7CYxo9xetJDOp/kN29GjCtuwSaEW+VboPYjuBs7S7YRrcOZ4/Kgfmmv1oSq9avjA1Qw4AgNNcO1AfhzyDDomcrc4qY5FQVnAka92dO5+hn9zeOPxR9NpEY07JDe6VhqeSPuDH0/vVclMJ8J7BsTnkSKGwmZIIDSOMLR5xqwx9YdXjOtHijk6657B29TlwSAW9NvnY=
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:455:1a2b:40a2:1766])
        by smtp.googlemail.com with ESMTPSA id t18-20020adfa2d2000000b0033b1a4cc2a1sm7711368wra.7.2024.02.05.01.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:13:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org, Igor Prusov <ivprusov@salutedevices.com>
Cc: kernel@salutedevices.com, prusovigor@gmail.com, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240202172537.1.I64656c75d84284bc91e6126b50b33c502be7c42a@changeid>
References: <20240202172537.1.I64656c75d84284bc91e6126b50b33c502be7c42a@changeid>
Subject: Re: [PATCH] clk: meson: Add missing clocks to axg_clk_regmaps
Message-Id: <170712440863.617794.2380345437565943814.b4-ty@baylibre.com>
Date: Mon, 05 Feb 2024 10:13:28 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

Applied to clk-meson (v6.9/drivers), thanks!

[1/1] clk: meson: Add missing clocks to axg_clk_regmaps
      https://github.com/BayLibre/clk-meson/commit/ba535bce57e7

Best regards,
--
Jerome

