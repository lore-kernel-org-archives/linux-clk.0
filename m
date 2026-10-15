Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B99753B61F
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077352; cv=pass; b=LmfhqhtV7bARU1niTqu05w7QVX1tQYkmajBwiByDYvLplf5zRFxC/3bMWtCXRbpzVayWTKbXy31sMkjwHCoy/3LeWm0LzVCTg2L74kAf8cwU94IgKNXOKeM0BBTDUeGDceYA6kr/CTcPER5sengzsn7PqT6xlQgowynqs3xO9uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077352; c=relaxed/simple;
	bh=IH6C2ITjynYuyHLytAInZHJ667Lrpx57dguMaAwX600=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uOVjnh+vZgiuh8sZYJERcctY0D6FbYfuu296yhIPxTRfJr1CmU4/ou23NFkJyAWsn4CjfYQNyFc5VFF6rQw4nKhgZ2xGjc4/Dd3DYr3OEn7BgS+ThvgpEgu7c9BbUtenN4xYYL9Fx74+AxBfL6A6iP9GfvKio7hNgstA+ErVYRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKnu4UbX; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKnu4UbX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2055573c8cso695900166b.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 08:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792077349; cv=none;
        d=google.com; s=arc-20260327;
        b=IIn1XwKnUuFC0MsC1Wq2im8JzfqWIYErTfqXKmrCxvoVZ/pZiDybGvCEgtASzn0yiL
         il/oVnh4UxrKwNrIW9Vsu3lfp++Ef1+rEYI28gHGFfCVj4xnBf+91ajE6M+jzR2fB12i
         FrOjFdy4t/VXmAO4NtfqiGUGMIs+TUGUyGKnRCqpePTuQXe8N1zbSMkD7HsYOvrZryTm
         I7pL5IfcQiIOKiTQLa0TpgdnOxQs5seTx8XPuEmDL6kq4Mo2F93Xg8PwAeDc82f/CydK
         NZXX9TrGZTQCjRKDxOdSPC4JLHhp0DUbm1peTaDba+ryhAUt4/eYCzNiywerM2Pg9iMZ
         fu+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0qzPWVIlKwsrNYhk0FU474psXi0lgPudC6/799gRiGo=;
        fh=4At3o7XnZkSZ1smRUjDhY3bJ7V4D6gkV/s+sNvZEKbE=;
        b=b/rNdycsAL3YvtyUUnxXMBKO9dFnnE9IHmzCJz2SthnzqMEQ1+75Qp8Sm3Fhyi0A4M
         9ihg+uTyEx7MvODa4U//fo7vo9wf9ldrLWaZIfJm07p5CM8RIlTZTBokMANuE0pOrLoy
         sanmRg60MIadbk36kWjGFIQ7TlCXZuCresZ0IHaKROZKrO6B5hZwmbcgTZygdqrOiTmR
         wTJNAcJZO8w5NDnsQDCxbrOGhoOKGCxN/HB8+b4kd5FS5SP71SfaJEPgVdR+SFjsq4aJ
         Nziw51DJv5iIr0LJKJzU/uV48lwFpbNuTL/C5QloDz0iLpuMLsjlwqtQzrCPin1Ww6t2
         zmlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077349; x=1792682149; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qzPWVIlKwsrNYhk0FU474psXi0lgPudC6/799gRiGo=;
        b=nKnu4UbXM55FqTwsXsL5rqRbhxYX57pXWxdWa1UIfw/Csfnu/EABonwqCW41UjrO/S
         PBC8cak+s77RlztOUXxE0XyKjCDRZBaDuFgLcfuMpFXYXH6X3LnIUoZK/S/dsCQMGDTt
         DJ1nkmmtzlF+s72190lS6CJoMmrXM+kP6VhRyIKVmF1eaSf7HuoksALVwaHXZag9tbIc
         4NaavsXfG1fqgEbIqqPfjb/Txg6crHj+1zmHr2zHrt1s8mntv1AFLb5IBO/6kXlElJea
         QJnZyePcN4+yaZ2edvoUtAbu3NHu7uZbbDNTAs8Mh1AU2piH0hpBAZVpLGvA0CIN0rEL
         udJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077349; x=1792682149;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0qzPWVIlKwsrNYhk0FU474psXi0lgPudC6/799gRiGo=;
        b=rvT33Qe6hZrRANRd74NaPu6jxKvoY3dXHV//gwjDTm95zvSVMtuf4SWyfWyg4jwLte
         mPEw1kKVNcd7ibexx37puJAeHmv3zwLeYIgV8++4Hr9XHjF5mEt7KVk8V56RT79mCzzY
         yfdPXhcJhdxD8stv/L5+dSlMjK4GdvLAifEWVi+gQQMDhWMB3qggHBmo+ou7FPTN9RwR
         +iD/0adX+sDlqg//QunzIDvbYhlkgXQ+JVNNoPF8mUM3yfw4UtDcEtU0Fpf0DMIGtVgS
         ybDM7/kfW5sN/mOrZquFrANvjEwPEUDXE3bSGjANlJPqgDYgRGtlziBFAfb9gh9Aybm7
         7wPg==
X-Forwarded-Encrypted: i=1; AKwUvBzsS1qkSK+FQfwYvs0G4TdgyxVTs8MHup0C8sbmVST/Cu0DlZCORgaHTLW2PjzIhQpQKaC89Or14Vs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyFvvJpLJWX15oD3hliLC2UMVj1Qrizt2nBCmDUGvQPHRRviM9
	lp3CUSevBCrdxQtjvsBxvHOS9s4Ch3Y5ORER0vALxz6HDpkA5ZskJLGHVvGqHhEDykQdWKfYI6T
	VTH7D1E13QT79RPnwfdhPTIYAH2miETc=
X-Gm-Gg: AYBFou1Mewgwc/fbmiCXhaX0Y6TLodDAjbH1dtzFy+dvfVftPZ41SNWTFOGf5XrVWN4
	yUkWPgeax6WDrn1m8/bnWkMZ3P+3zhm1EsL4TwjRE/ZlvwMLM5WN8q6uFCZDoTOTpPe24mNjUec
	7RVUKwLKtUr4G4XMHDL0sB0aARaRspnLGOmI0hmkwVsn1dXyFOaDKmD6uEoDIuOIxrACimnniaf
	9xqMCAewenv1QP454KPgRlfdMWDAuPdWkT4bz5998zbisSwovsiSsjUhRlCIujHOQiV1URFLDh0
	uejW24HT1SNqdslEh6eZHQFoddeXbm0Frz7RD61/L71GBsRixqdDS70ql5iNt6lIqCJVA5lfLu6
	n6jHZsNSNzYgtd5eEkyEBSCWDlIfKSvDy0QUZ/sWt/E0=
X-Received: by 2002:a17:906:c155:b0:c2a:d65c:c194 with SMTP id
 a640c23a62f3a-c31a9d56761mr1838328566b.29.1792077349343; Thu, 15 Oct 2026
 08:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
 <20261015051926.13752-5-sreeshankar0910@gmail.com> <179207236622.28934.8455006218721757519.robh@kernel.org>
In-Reply-To: <179207236622.28934.8455006218721757519.robh@kernel.org>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 15 Oct 2026 20:45:36 +0530
X-Gm-Features: AclHuK8CtOHEeDeQkZ6GhBte8PNJPOJgXaJdB95NIQjYT2X3-p2J5_V6n9AGVI0
Message-ID: <CAA-+uk+iNj0TxAkUgGSHhvBjDf7_EO_q9Zv6N1f+eoHBJf=q7A@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] dt-bindings: interrupt-controller: qcom,pdc:
 Document SM7250 PDC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, davidwronek@gmail.com, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, viresh.kumar@linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, danila@mainlining.org, 
	jbrunet+clk@baylibre.com, linux-clk@vger.kernel.org, sboyd@kernel.org, 
	konradybcio@kernel.org, andersson@kernel.org, radu@rendec.net, 
	robimarko@gmail.com, bmasney+clk@redhat.com, rafael@kernel.org, 
	tglx@kernel.org, mani@kernel.org, linux@gurudas.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2026 at 19:22, Rob Herring (Arm) <robh@kernel.org> wrote:
>
>
> On Thu, 15 Oct 2026 05:19:24 +0000, Sreeshankar K wrote:
> > Document the PDC block on the SM7250 SoC.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
> >  1 file changed, 1 insertion(+)
> >
>
> Applied, thanks!
>
Thanks,
Sreeshankar K
