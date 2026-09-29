Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C874A538D8B
	for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 16:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700643; cv=none; b=Z8rkjL+E0vjB63EJDmPrZvXaps2BFqeeEnIU4044eiHjx2lMLSYBtpWx/RDIeUmGP5Aqh0ZCLf2xVSfFF2mu6iEt1KV8WS8py07w1HBdLCK5DeE6g39BGuoQhcMFAtmj/5RoDdUR6Z+mO9u7ynCo2WcPW/cyZB5wM6hFfbiZCFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700643; c=relaxed/simple;
	bh=+iUVjaJjZ1yPmy/n1mBGSq2N3Fdav7GrK5Nuqm42rSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HtPA6pMNh6cQveta/L2I4YT4qQioR+/0KHuKljUk5MstTGIJtXSiCQQPD/KAfvpzMRhHy6ZiX5zskgDyVLY+6XJ0OLS9ZWe47gLp8ucWdLofx5VSj0C/0M6kTOYThM4xKKADu01pXOjyYJ9vF5MOadAQULL54dPBm1f34HRjOVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QkW5Nec5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bluIUX13; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QkW5Nec5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bluIUX13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790700640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMwQUEL2z0fBdiJE0fwkPV0jsOeJv+8B2BQVgLXNy4g=;
	b=QkW5Nec5PtjRLGINtf9PpviVJQ/UcxMWERj+4oCmaW96yCohBNly8cCT0p5Mtn+KMf8wSA
	lTzpKC250nklO2JQkN4TCTxBM/i6TVdL9g71d/UH/P1tF0xtxUepZDW83H0NQLgDh1HAG9
	mntF0fmyih7U9mvgNW4H1+0ohiU0md8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-EyHkKDIwNHOoyy2O0zpKqg-1; Tue, 29 Sep 2026 12:50:36 -0400
X-MC-Unique: EyHkKDIwNHOoyy2O0zpKqg-1
X-Mimecast-MFC-AGG-ID: EyHkKDIwNHOoyy2O0zpKqg_1790700636
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53333acddb5so82136071cf.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Sep 2026 09:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790700636; x=1791305436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMwQUEL2z0fBdiJE0fwkPV0jsOeJv+8B2BQVgLXNy4g=;
        b=bluIUX13KVPLn//j5As3xtdQzZ3HIju8gOfYBgKl8BdDUS91yJ5kvSHIVRRlxj5gfY
         hcPQXyoXoLMh/+8mAAss2lw1sq1Qoh1PawCfYkMrxKgGk6bebkAMEGW/xPeCl3h3eikX
         VEVSDTHXS+m9FBXcqPWvkmuS1Xp+s5XPOTXlMoNCmHXzuKofKsbIsL6axBC1BIsuorLi
         LWOJvaXBvxQVsdAhopkvxyxfcSGGPxjRGDs7pUaprt3mWT6tyo/Bl88W/I0vuLYspo7n
         +U4DrYZ8af/F77RKpz6nHfvgDjnPBhSlqUS++J0wupUTnjup/G4Vo+bAAEcPqqXKGkFA
         ++/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700636; x=1791305436;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xMwQUEL2z0fBdiJE0fwkPV0jsOeJv+8B2BQVgLXNy4g=;
        b=EPiy0L+Xn/kp87zOR9HBBu4taCKiTyEZjF1Y+iWiBfJpHF3KOgxEjKPYyVGTCGvr1k
         UkyVEn+bSZTbixxG/ME2d1ETROwLEUUz6ZZYwCmErJvtA73GCoQtzkfNvTh4a965yh4c
         w8EsFiO6Uw18P3715RgWv3bHcZ4DZUolc/0pNuS+0u4V5r8ydyzLoUcj08sWTG71tdQh
         UYHfl2khAW85VYrW0Hq5lPW/koN3Ez42TOHq0KTrGQBAHslou282A0hl+ofd70KtZ737
         5/iGWbXDlN7S4DDl4yNUoeQvg5imvLtE3Jt7wf1BGyYh/YF4hH6cPOvZdEyxih9iqF0q
         Ct7A==
X-Gm-Message-State: AFuF++nRepuXrW/iLlqiRFZxSJDP0z1E16Sqy05q2VZ3Lfmaqa2a46/T
	MgkrkCMhMDW01jZ/sShPc0j5GrkNY9E5rSAQrsNb3DhqoqkB/y9PBQmqb3GJwYgPjgLP1MFibjI
	mEYaSAn8m4++WT1x46eL3PkfGuK/0Bgumej+WKpI4zg/w/WRbhqZ5VOjnzpB2eg==
X-Gm-Gg: AYBFou0xMbwrU7zjuVLhUEQPiYe8A6VDrfWGpLOgc03eOjYJMi9ZaLjYKS1eNadQ8da
	l3KE9WaDPOm9RzgizIKSvg4D2SmtsjnExTRagjekdWBUaeY6P32fNz6GooN3Smngk/h4TP7w7DE
	+9x3+wPCRWcAhKG5RJUjmxgfGi43lrzgynGTKBSDTgJ+sTDMLUpH44hv6LuMEvsFbxcQgIwUgfk
	jhPmwFsqpGDCrBjhxtAU9BervW/x3X5BzeXNJW12NqjUG3jEJt+qF/7a0wePfRn30Z3xV9wBdR6
	zAsrN6StLbZ5GT6I+mxvhhxGHJCz+b+oP1pK4ZfJnnGP4GyCFeY+MiDscbtncie+RyRd8kvDYD3
	8pnwW5VIfGYWNtJV+crSWZFuKKQRZA0G1wPfx+1eY2/GY+8OQmDI=
X-Received: by 2002:a05:622a:99a:b0:533:3af3:43ba with SMTP id d75a77b69052e-5333af34e9emr150728451cf.37.1790700636088;
        Tue, 29 Sep 2026 09:50:36 -0700 (PDT)
X-Received: by 2002:a05:622a:99a:b0:533:3af3:43ba with SMTP id d75a77b69052e-5333af34e9emr150727971cf.37.1790700635522;
        Tue, 29 Sep 2026 09:50:35 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d303573sm14401716d6.11.2026.09.29.09.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:50:33 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: David Lechner <david@lechnology.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com
In-Reply-To: <20260906-ti-pll-v3-1-d1751f4648f0@gmail.com>
References: <20260906-ti-pll-v3-1-d1751f4648f0@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: clock: ti,da850-pll: Convert to DT
 schema
Message-Id: <179070062597.199845.8971764534799721184.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:50:25 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=313; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7sbHWudVkJN1j/cQcAiFsKbxRWcoILZnVP9RoCk0sEY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2vwk/XPP95fJvi1/uPNa9MlF3bbnGkoVrt5Y/Kn1Z9
 eC/5pck/Y5SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAm4vOckeHZIfX9Pyv5Ypf6
 2ASvm6DBFy+0LvPjBOsmN6/PfNf/xP9j+O8eHDC90e7jCiXNGSxCtx09OU3/l9Su8GuwnVP5tK7
 /KA8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 03:10:31 +0530, Bhargav Joshi wrote:
> dt-bindings: clock: ti,da850-pll: Convert to DT schema

Applied, thanks!

[1/1] dt-bindings: clock: ti,da850-pll: Convert to DT schema
      commit: 93e5dc301c87fe6b7bae0b087a15be69e521e657

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

