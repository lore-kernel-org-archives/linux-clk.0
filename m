Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8FF1BDC3
	for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708877472; cv=none; b=XmYoj8TlLSd73Tbs1PleuTyNhS9z8iQ2pTxkP4O9qdFIItCrhB7J7r9yV7aFvNil6rV0pjhDEIfLFKVZdYGVVhanfALkLEW2xdbOpBTOKmOCYA+KzFhGWUjDaX/yn62w8mjABJuJHJhe5ttAHnPliH69tooNf2OtD814lBiYGbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708877472; c=relaxed/simple;
	bh=cU+ktrd9n1YdiXM1Kh/vgAaMqYKS0NvqKmr3Z7+AuMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NCDNWj7i1JPQ9QEOFcPz40l2xJKAL5Vf6gcFyKu76aCl2jPd6NYPvemhtSJd59PoQmgP3aPippbObya84ZMb38OhbB2ue7o77zVefcqALY7XeQ9I6rJJ0O8iT+m4NmPz0Ywae8DLHWZrH6YqHbSbr/JC5K30LcGRadcHVWAMZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kct1azZu; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kct1azZu"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d23a22233fso21395061fa.2
        for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 08:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708877468; x=1709482268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KXVaOKFr5kvye95hXniuMdgC2oHUvYmqm0J4NG2OIs=;
        b=kct1azZuNZxGpkqxvTy7dbvBPVPOhtsIwwCCmYpacmIRLhtEFFNbx6lGmv489CTbBi
         4AT5qYVyHDzNQRm1g0+Ux9xsAsmrIfM6HXK07ofOoo4BLHZvJVzbGag1fSZ33GQtloY4
         gmCgEJOTRqlErRQLjg/1nDLaE22GjYIdgruRTiuSL5AjoUVMFtVATWIZ+iuCK+1YaaSL
         ARHXBdLcmIhhQUQPmIN8X1rAbC/ZC9h6vKl0T4B0Q/F59rfFw6T76wYatzFn1eP8b7XR
         E9wV0FuBpDZSI0TbLkQMPSlOkbSl87Pcx2P1zuXCXn/wfxJNQC4YVbsWIMdVq7DkN9yZ
         RkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708877468; x=1709482268;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KXVaOKFr5kvye95hXniuMdgC2oHUvYmqm0J4NG2OIs=;
        b=PCxC6fXslP+pNlqYYKBca9i5QEdZcq/uD7aj4BEYnabGyfNrpnW50r/FGu3DyF9124
         OPZnwuukCTqS7PT6qfIe6du4RwfADlXLAyhxAyIhD18AsAr2uavF33XGnQTOheSeAoOU
         xz6vzyz+fcihEiaL1JTR0o3+8Sd1nPbaQNAEDSYY0PVKYUhNWbybWBTjx4TZvZNVPrVJ
         OmeNjITa843ILAFJjNdgQAXjvviDBCEN+O84CxCrn0EqFeEpJO1tnXxXcuHdNEdtwf8N
         N830kRqtt5f62sFDyKNF74krydL+SPbtomGhOW/nenYOYreI7CMshTheJADL1lvo7cHQ
         yH6A==
X-Forwarded-Encrypted: i=1; AJvYcCU2BWS/h60rUeKH9ar1LorgnQch5n7fIRvcQACf4mWoAbC8PWfgR4Urz9tCtbNrdAUFglv9zYUzReNT3KaMM2FD4NXDA5eqp0X4
X-Gm-Message-State: AOJu0Yz3pSQ1dD59JAJKgS4iTCjTJbIhfceOqfdpDeq6dHldiC+XMYFn
	2bdU239V/G4gc38ZrRvkMLILhodEgZ/Ul9qy88zmenCLXEXP2/e7xJrSl/2PThQ=
X-Google-Smtp-Source: AGHT+IGBSbDT8sCsvS0w3yvOiCct9/Bh/XM1WMHea5PKYhnydcn6owioy2ov2Yd8mpPObPaj6UGyvg==
X-Received: by 2002:a05:651c:220a:b0:2d2:4374:b71 with SMTP id y10-20020a05651c220a00b002d243740b71mr3393789ljq.11.1708877468468;
        Sun, 25 Feb 2024 08:11:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e7215000000b002d2697570fcsm579184ljc.93.2024.02.25.08.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 08:11:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240224202053.25313-10-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
 <20240224202053.25313-10-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 09/15] clk: samsung: Keep CPU clock chip
 specific data in a dedicated struct
Message-Id: <170887746655.215710.9580664950836563273.b4-ty@linaro.org>
Date: Sun, 25 Feb 2024 17:11:06 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Sat, 24 Feb 2024 14:20:47 -0600, Sam Protsenko wrote:
> Keep chip specific data in the data structure, don't mix it with code.
> It makes it easier to add more chip specific data further. Having all
> chip specific data in the table eliminates possible code bloat when
> adding more rate handlers for new chips, and also makes it possible to
> keep some other chip related data in that array.
> 
> No functional change.
> 
> [...]

Applied, thanks!

[09/15] clk: samsung: Keep CPU clock chip specific data in a dedicated struct
        https://git.kernel.org/krzk/linux/c/9c746e5afdc3f784593c903d4be3d418f75d7787

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

