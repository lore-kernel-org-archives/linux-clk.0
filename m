Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCFF13D623
	for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 10:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713781528; cv=none; b=Ka0PzX/Q290xUQ1agwHvjRh2DMbEPdoMEdeka6ap9yATztAZA/1D2kF9cZjy2B/6MNoW6LvM/39Xxh4W5NEAW7N2FzQytJJXWUtUl0eFwSCQ3GHehoVMimmhblmQxTN2Awk/yD9gYr8FbKgpF5FEmFdSYsaLx42eXXCbl0ILi+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713781528; c=relaxed/simple;
	bh=jJqY3EzcXGU+nKakTn7MTvOCbow73aPwa+neDvl0lh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XsWkWl5FO9n98JuvRxT2BY3sch9LhT/S3EtB1pITqjdT7DtsdH0J1rwUURbsOkgNzwxTmcrwHmqoiWHFSTige5ybqog6XKPjphDvL9q9qHAwUFZRx7NRJUnZHHP/A9/WoZ8ZJMNhYxMXLmnVo0ZW+i6BMQJMx99pwQjzh0gZ7mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b5yt1zYl; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b5yt1zYl"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a52223e004dso392211166b.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 03:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713781525; x=1714386325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjOFtSdcuWQZYN13n2HXTmueHu30sawDV2mP2f/7YqE=;
        b=b5yt1zYlTK/gPb6cEjOq/3J0TN0egOXVIQjvE4tWCelmB0HI7P4bBEc39GySaFNB+i
         WtB4lnLZS/2xTztLeLRwWhA/niqSMy3AlOf3MktCrxTSrZ7HKLtSwjSs5N4uP1U3Weaw
         H5JBVPKtzHgQ6KVyQw5ObO/ZD5CswaJ7Yi812kmjzgMMzBpy0VBMDw8kpzZ3EEhrHgHE
         3vCuLUs0Y/7H/lH7RHO2RzuDmrxauDlliNE4VRmbYI/cEEQ52csVyhxv1s94iY0NYEh4
         dXU3oeoC5gfykcQZ0DibYURmyiPxeIm4X6Woy31emwt9sn8koLdLgR4PGXhh0JzJ0pRB
         XQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713781525; x=1714386325;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjOFtSdcuWQZYN13n2HXTmueHu30sawDV2mP2f/7YqE=;
        b=ZPu7BNKjx96zo+YgadpQDDD8zyWBPTjM8932OEdRUOZEhlJMJt70Elp5bIYtgyS0er
         FQ6r7LEXkNzBZphJwiuPJNtZE4H4N9DNyQP4NuUrswgIjkVucsQJrqQfrsN3EBuxXZeV
         i3n7ZzB5/2CgnS/xFF19OU1ndBGe8sNbvqtPijv09mZ0jVPj2+FKTVYFrxSJ3oJ29is+
         6gItYdlCAGc22qsCI38IsSRTknjif76JiXgzJ18DiNEQAQZ0oFj+0gz8A4xR7lZtZoIU
         oLcqF2DqX9mOWqVeZAhWACu5ZW5LNaNwEuDW0yd06w4iLUTqH6CRSG/HN9AFahWP9iIe
         yy+g==
X-Gm-Message-State: AOJu0YzbV1s7FiypPwslKBPa4rkc21X3mG3xD2qLKApX/jGR60CF5QQN
	G4+l95cu+Rz/uVQiZqIcL6nzHZY8iiLcf1hM0WBmQ9xkvrj+1X3HlfxBFWcS+ok=
X-Google-Smtp-Source: AGHT+IGJbFE/xk27S/lBooXeZazvrQf8V1BxKpteLDJyf6SzZbXaMCLpiQbsqNz9JHTqiEI/1HgXqA==
X-Received: by 2002:a17:906:3ad0:b0:a52:57a6:2f45 with SMTP id z16-20020a1709063ad000b00a5257a62f45mr7820235ejd.21.1713781524763;
        Mon, 22 Apr 2024 03:25:24 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id k18-20020a1709063fd200b00a524b33fd9asm5553172ejj.68.2024.04.22.03.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:25:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240401-imx95-blk-ctl-v6-0-84d4eca1e759@nxp.com>
References: <20240401-imx95-blk-ctl-v6-0-84d4eca1e759@nxp.com>
Subject: Re: [PATCH v6 0/4] Add support i.MX95 BLK CTL module clock
 features
Message-Id: <171378152318.2944518.13528932834119248200.b4-ty@linaro.org>
Date: Mon, 22 Apr 2024 13:25:23 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 01 Apr 2024 21:28:14 +0800, Peng Fan (OSS) wrote:
> i.MX95's several MIXes has BLK CTL module which could be used for
> clk settings, QoS settings, Misc settings for a MIX. This patchset
> is to add the clk feature support, including dt-bindings
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: add i.MX95 clock header
      commit: 977b07f769970aec97b907cfc93fb681ecffc9fe
[2/4] dt-bindings: clock: support i.MX95 BLK CTL module
      commit: b773f5ad2bfd2d00bd2c5ea7022bc5b86d23a1b7
[3/4] dt-bindings: clock: support i.MX95 Display Master CSR module
      commit: c6e87b066756ec4b3f5f9061b508f3bd724ec652
[4/4] clk: imx: add i.MX95 BLK CTL clk driver
      commit: 5224b189462ff70df328f173b71acfd925092c3c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

