Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D86329E44
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 15:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953724; cv=none; b=IHv7vAzAaF3LKG3wOGeelgigC+/dOpbYow4jiWVppQqVnIfyP42U6AbAgamPrmrljgW2COoihmKh7ItyEEcqYDcUryTvalPOTge9k2tCC1/d1dA2gQDI7GInR/18TR9f9mdlVC4dFzN3AGehr1+WbuXLy7M78/B163203RV+u84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953724; c=relaxed/simple;
	bh=nzzaG++30e7eP7gzQKASjcC/CQNsfJv4ueyQSdSfHAU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=plXHsI3dNRgs/rGnM7sj5ARBf67RPztWb6rSHF3K/oavpo7ooemD7MUu/3+5KFURY3c1Kc3hgdVWeGYqj3Xny0leCZcvOnngmdW0AnWAAQDtR2cUJba7p8dhKmaRD3by0QM95/XTiexjEtw1VRvZhsV3GzFFCIGIMrF7ndHOnOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gf3pglWf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pxalEcfV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gf3pglWf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pxalEcfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790953716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LD/A3nglaC31jBIMtUDrqXBiepN73OFs6DJpCa6dtO4=;
	b=Gf3pglWfrqbJTauSJEYdtySw15tpLwpmvdX4QPA8PCQTvTLYRw5O7Yt1XRqlFx8Yqi74mH
	Hb3A1Fxhsv8i0lkm/cTXBaG0bh7qs+X05+6bPkdki6E5jV8dK3w7QU33+6aIFbgO+dmzGA
	p4F+YuLSyQiCHhblyCDltkkX9/sv14Y=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-0Z7acHuxOme3AjusNrVrKw-1; Fri, 02 Oct 2026 11:08:34 -0400
X-MC-Unique: 0Z7acHuxOme3AjusNrVrKw-1
X-Mimecast-MFC-AGG-ID: 0Z7acHuxOme3AjusNrVrKw_1790953714
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so154314341cf.0
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 08:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790953714; x=1791558514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LD/A3nglaC31jBIMtUDrqXBiepN73OFs6DJpCa6dtO4=;
        b=pxalEcfVm3yGOi25gW2CcXzbBeRIeAPEiDSMAhlUHO22Yk7FY9wUlTFHCsC4SLzp4S
         LuMoX/5ivXPdLdWJzh9HlrT+m5pm+Rd+VtD0R358zXsAqzsFGw/15Abbp735wiVQX2jc
         e/+5hCSEeMp+JyTcmJqcRrE03fw3fUmAjnjDX/0iV1WTfqQi+eg3FB7HL5qBXvMJVy7Z
         71avtjq5ZJmMWqDPEvdxlsVl1jEjsLYp7VdkVVvJM3zyTtLmdCn9v+t+neosZEXoohgG
         COD5m6GRVIwnXR0Qhx0RggWz0kI0tEXJjvzQbnWQxhfIChnIOXV/5MlPnZDQFoWxKlmQ
         edTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953714; x=1791558514;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LD/A3nglaC31jBIMtUDrqXBiepN73OFs6DJpCa6dtO4=;
        b=ptaWVArqr6YzL+yhR21whyYHha18sA4M0FxWw0ko02TRYAxXgJPQ+X9qxy0hUhxnPV
         TAP0PSvJqAxfnNeWIb+pEqh2AXTLMTQMHV/b0meGYRg3E3UrbimRBQBF4qfW4YJI6gOP
         Nj1FzMoj5Ou/tHUjQOlrjj0caaZL2L/zZkTuANPUzUnJyMNVRDPdhFAO7FvnA6B7ViAm
         DBGVahTi+nlZgBe0Nckz1H737B/BUeszXtDw4EOUEmRwCl6bTjrufnhWspNeMKHNVagJ
         vi+j75TlSmNP+CxI4RPoBWFc64T2BWjCFHY3WLQmoEwCD0wwt8i7lB71rfxlqHiXY6yY
         u/XA==
X-Gm-Message-State: AFuF++kM9blMJPacKM5zSL+Nzae4kvx4GWWRIStwYZwxV7p95F+lvL4V
	okz4ZdHkjwwGOuChghoYRY6sWFnYu7Qkz/zYR7olrkWpNn04jj2okgpAE/OaYV+kZ6DraeEA1vw
	36o5E4FC3K8Bhj9vTdRE3o+A0/AdNEHZbHX1tRAEhpUM4N4FlEbxIiuH3zJY8rg==
X-Gm-Gg: AYBFou1nl6FeRkih31nxsiQ7Nab5o91gP/JJCSHECHnVKnb0quUfcn3+pchRZpPt1wE
	6S9qHK0KUYLMY+Q8giSLeOzoU35J2e/5nUEX1YPXWh6Mo9MaPzHAFGFsV1w9cchfBMIIRQ4EG9e
	lg5NqxxqDoZFOP8i/8yuK0uSA+U/ciYjj8ILRwc+Z+QyMkZToISbY57B9l7eTIG7xCftbl4JfVt
	dInYbS7RvAtYREZyH7BiuTjue3eLo+w6fucWRIlwBeC5C2kYC44N3Q1V9SMll9JV4lYKAxKfMlp
	GUM0eyY33R9kBIZcWc+HNiNVALj9+pMKhwCfs1f5cHUphxc+9yAwyy6LhBVENIz4IvCtLk1iB0N
	qV2SkgV9a8yuyLgaUcrDGPZ/1pWSChZzedv6YSVfLrfBOm3R7Xv4=
X-Received: by 2002:a05:622a:1353:b0:533:3610:c5eb with SMTP id d75a77b69052e-533d96b6966mr49792441cf.53.1790953713772;
        Fri, 02 Oct 2026 08:08:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:533:3610:c5eb with SMTP id d75a77b69052e-533d96b6966mr49791681cf.53.1790953713259;
        Fri, 02 Oct 2026 08:08:33 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398d128ccsm27596841cf.24.2026.10.02.08.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:08:32 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
Subject: Re: (subset) [PATCH v13 00/13] ZTE zx297520v3 clock bindings and
 driver
Message-Id: <179095369547.791677.11922932020340915175.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:08:15 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=LWMTx7OVyEurkrK8gxvgvVLf0aBDX7nOCsHhfPnuLAk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2n3j1sCJv/pFzhTZJnIp6XLMW1T+Zsn17zf5NPhp2l
 nuniVRzdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARdn2GP5ylRUdjm2eldZ5u
 XD5jQ+j9xzleR9dJh/49fXhFlVPSDB9Ght0/fk9fsCKpqrNG5anMU3n7TWp/uuXyZ0pIxLpUpGv
 P4wMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 27 Sep 2026 23:13:28 +0300, Stefan Dösinger wrote:
> ZTE zx297520v3 clock bindings and driver
> 
> Hi,
> 
> I am sending version 13 of my zx297520v3 clock patch. It addresses review
> comments for the MFD driver but has no other substantial changes
> 
> [...]

Applied, thanks!

[01/13] dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
        commit: 9b9e5daaea8febcdf67a656e76b3a7e1d0f2290a
[02/13] dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
        commit: 3847bc94d1746c1448c984338fcfdf1216db0827
[03/13] dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
        commit: 4500e2e361ecba42cb1abd6f6891a45d99f57741
[06/13] clk: zte: Add Clock registration infrastructure
        commit: ad5107a88e993b576b01761c6560e157519e0f84
[07/13] clk: zte: Add regmap-based clocks
        commit: 0f973ffd1038e2bca5ad89279412a508df62f44f
[08/13] clk: zte: Add zx PLL support infrastructure
        commit: 77732e66cd47e849031e4fc8999cbff0ec958deb
[09/13] clk: zte: Introduce a driver for zx297520v3 top clocks
        commit: 392a4957db5c2f2c37bf0191d9531710b3080dbf
[10/13] clk: zte: Introduce a driver for zx297520v3 matrix clocks
        commit: 4ea299afff42c6a09eb1aea1d29c678c3374b824
[11/13] clk: zte: Introduce a driver for zx297520v3 LSP clocks
        commit: f8a3cbf8678ab80d3aba5918f2f5e1acc1e7287d

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

