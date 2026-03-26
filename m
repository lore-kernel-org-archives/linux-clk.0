Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD0133F370
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549717; cv=none; b=i5AxaoFciVR8WBEYit4Ab7eCd7i48uf7l5Gwgewyq9KOwUEfCIn24VcQPnu9NhIEQ9edRoYas0kUo3JLeYkHNQp7ATv7QLLz8TfaQQnrNQcQ1knumClLaRRdeomElYOBOORKlOHXDWdIGrJydsPL9F1ArjK2kQOxZI3Yt1sYuKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549717; c=relaxed/simple;
	bh=Jc3WGM9+nSXAgx36gi73IUpaDeFuSOdmq7+OowChnuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVSepnw5vwwE91+K2TcTVX2FEVpYv4wFh420GI8JSQdYSGkIevU4ud5zNjdMoNkKZ84qT2nFqameE6UlQiZE1CjCa/s4kL/DsIbTJyc44KPfrKCc+eHfYylYnuzHViOUW++YCSWmOkNrwRy6uWlEKjE7ZTo0aOuqSYyP7CweSg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ng8H+v2f; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ng8H+v2f"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so817952a91.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774549715; x=1775154515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xq2guOjsOaSspszJVZHGbMTfXj6L3NYNNr8K8Ir/mPI=;
        b=Ng8H+v2f2gb72FkTKL926Ur2LpFCywyblJxHiipmgBBoesWnFT9mK4JGhYLTFG+Gms
         CfY5M4yzKUScXweA9XyaI21nEB79fAFAgDRMbj6gMLA1sMWVRWBcSbmF4vyFm+pg6FTA
         okINvyZaUY5KdplTpCBaiPJhSW6cmDLzAgkoZxuJ1lXkOuwnVBYqxexny/0HhKkvEXaL
         L0jDS1WkN7jAHkjegdotknB8wEO9OLsP55Aibjwb0qORUDXWd3ZdTGp+PECnuCuClWmC
         kC7nUEyNcLXur79YXFvSJj6h8kFLoHXfFihbkjPGsq/ZJukbimctau5N50qkhz5kw2+S
         gntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549715; x=1775154515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xq2guOjsOaSspszJVZHGbMTfXj6L3NYNNr8K8Ir/mPI=;
        b=NaLsGNp8+t6yBohoJTxGsAadPgJnZqbFuzSxUoEnUejzcBnWeNo9oFQkCo1M7eV1jl
         Xa8iqyAnpEXJMAlOGyzVSEDuwNG5x4hlaBzqvzRKkqWqUE7nfuCXCvz+KGbpXUVA2PwQ
         yXOoSpyC8L/rxqWeW9xTZ2PLmIRPf+hbFcoXUc8F84NaEl+o/AzlXIsNDXRs2yV3tazX
         WlSjL3Ef9xhbXi9w9WsE1DDpyccX5CzOnoieRqZ1IziMLOCV002FEZw6A3uy824n6w+5
         OM96LtCsK4hNwHqlilNhyCD3vviTKNPf0RsZdNMjhGLtfVN70E9V3K1pEgmbvUuY47FL
         dv5g==
X-Forwarded-Encrypted: i=1; AJvYcCUeiQcaPDP614JvsKIqd2Ar7+igYhTdN0re0KDHeph7zB5bjpEKoK2uNsBuGd5dxTYFnjAe1WA1agY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA1JRnrklX/i/y3NkVmfUoHfFysuh+mLBDRalHi7aeBPy/iNjz
	DGmhXvNyPWJYNwiT7dFP3Vd3rxJUDx/FdNo928TAAU45kTbTWiULMjcb
X-Gm-Gg: ATEYQzxR8TeWYTWeNfQFXeBQnRzoGPPrXoZLA8vnUHSb7dp+z2d5jNxQR/w3urq53WZ
	gtkmdCv+I/jnCf9eSLLynuDTtN55fijNWfRlhZZKIFBN/B49gytDAursJ1jkwW9clmwywNtm6Xa
	bu2tqMnbP4pbopB5QpPGcTeLWVTGOG4PBZzRwUQsZP8Rrlkvh7yBIkR4mBxwyvr8UmYR8mUN3Ed
	vPN7f/NVw+hPJExmuL/VBx9G2s6toWVLoGh4RzlHP+ZbuV98yXr2xXwQuFuDHHm8I/FEDBdlWgb
	fZsJlfoJZ2SpMXuQjquCAKp941lZ44ylL0dUCMk1ntCvTTbp7FmfPUv5VzJQpIhBQIA0wyewkMk
	1jOOusBgR4PBg3rJaqvrela7YLfJKA5c2tVVDHJKvPfFnxZufEYaOsVsWekuRpgU9FUu9b4AY22
	a+1wiJTtsWRm7WLHHuXJGEUtAlJYuhmz0=
X-Received: by 2002:a17:90b:3fcd:b0:35b:a30f:8bfa with SMTP id 98e67ed59e1d1-35c0dc813dcmr8363731a91.7.1774549715010;
        Thu, 26 Mar 2026 11:28:35 -0700 (PDT)
Received: from ArchLinux ([43.251.91.119])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc795f08sm47816045ad.21.2026.03.26.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:28:34 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Date: Thu, 26 Mar 2026 18:28:19 +0000
Message-ID: <20260326182821.8332-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <593b3801-a83c-4132-970f-5075ebca2bc4@oss.qualcomm.com>
References: 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 Mar 2026 10:41:03 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> > Plug in USB-C related bits and pieces to enable USB role switching.
> > Also, remove dr_mode to enable OTG capability.
> > 
> > Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> > ---
> 
> I'm not sure what this is going to do for other 6125 devices
> that don't have the Type-C infra wired up.. Does just applying
> this commit alone keep peripheral mode working on your phone?
> 
> Konrad
> 

Yes, I have verified that USB peripheral mode is working with this
patch only by using USB network[1].

[1]: https://wiki.postmarketos.org/wiki/USB_Network

