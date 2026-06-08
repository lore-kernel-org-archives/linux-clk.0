Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C7D390986
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 07:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904038; cv=none; b=NEeUChsZbkVXTwMvMbSwxQ4CC7TarzwfTfuSjUNGUho2u+qeodOp/7w1a67mXf3GoNVg4PFWRCbaAQFHqS6BO860asy7waBhNo82/11DjwwLnM8Z6wwLbDCGnN6UahUK/GzExGBunuiMNVEYHTs05k9QLeYdZua05Uxh04znkpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904038; c=relaxed/simple;
	bh=JZV3RuIjk7olDlPabOIdv/O8zwlGAlzLEmaLXcyKcLk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=p4ekeJXZq12bNu2vsuhYjlbzY4X7kHXS54buTNXDQ/NNj6Ms9Gz4+xrGSxIeSKWHpLYn7Qpw+JbjxVb9tr7gmCQpvo0FxFJDOcLH6mn2BdamQeb9jIf0vomjoUexBCVC0bofTzrH1FKTfTkx9A+lDRnSZAK1EcxXO+zrITQ2z34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zXqWonrW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zXqWonrW"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-beb8a08a6c8so557465366b.2
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1780904036; x=1781508836; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZV3RuIjk7olDlPabOIdv/O8zwlGAlzLEmaLXcyKcLk=;
        b=zXqWonrWFhauWO395Q9+0HIxwy4vwO+PkgEKGSBJ1qpZ1bh/XpORsolDvvzCSIAXQV
         gUnJRBUtelCcgqPdViQrVpbFb0SNlYumwjdWwxufnh1zbgg6W/0RotckB/ZtiA2UjMDR
         WE8U12rGibdjlyPDBrlyr+1/c9TOOlSXBEiwCCn4UxKtp4SWto0pfFfFDslBH6uKAo5R
         6mVJKPKmGI2wJwT6bwLQEQwmwF5zkAj3NOWtYwNkQ30frILx5J4D/6ZqTjemYVKew6MS
         gL4abfzJo0jsX0pBDpaO4kiKHplWefWimnG3emrWrb3zR/8EhLBbzFS/+OX43neTAl5/
         8LAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904036; x=1781508836;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZV3RuIjk7olDlPabOIdv/O8zwlGAlzLEmaLXcyKcLk=;
        b=tSOMqRyiQyIJaDoAtyYPf4xw6ATgXaejZTrs+sdrIO8y6EHb0ETecxrIRsGr33Ej62
         /mQ7saBw+0xcUv0BB9nszxK49x5B8wXkqfiiAXf8Ku3EEpf5ZZ4SgBVke+PfvRE2K0rX
         NlG2h9TzPrujoOh5bLQAEisYF7UwAhbqVIQP29XLes/cU0zI0mR+M/MdifSMkjg0zHt0
         opfErxw+q31myb3fycNmLmmHbXbbChbc/EUgvm+keRwvelcExHmETiVXi+MEQ6B+bgam
         /u8+umjea4khHK0aw0ZDVud/0Jva8aXhUFX0yRDTYNap3K7Ai9S2JIkVkQwwc5iLoBEs
         6L8A==
X-Forwarded-Encrypted: i=1; AFNElJ/ExlOkKyeBUyzbEih5l7WV/yPRj4h6mHbfk6bq+ajsykA0xXhP4dZmRjPZmxjw1NivXSAoaOgP0KE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUkxmw+ENF0qfyUka+ek5AvoUhEev39SaxtEGo4WMxHs24fstx
	Xfq3lTLJf3kPL9EMUBWfd99twV/eZSrCpK6he3wWdWSIVS0RvcXPWKtDtfPrmSPquu0=
X-Gm-Gg: Acq92OEpdNqWSVbemcPeLok55bXNThReNR4JX7WYKcCRkf+9KfMjOnJJEvMAanxwx2e
	eNv0KX/I8tH1778rYh3/TrOuibKvyb8J6sKtL2zA81i6dxY4uRz3LSZOTonj0B9YvbgHm6/jTAM
	MlcMyxwsJ9AdZcgEutMZ5VfZ47mEGWk9wBCcddMyds+qc8tn7p7dm+NQhGIsef3e6vWQfEUGVrK
	2s5p4Sy7aeaSrDs7rJKFmiFEvh8v6HMWDdrIbOMXCX3U5Q2mI+F5IBcLx2l/WutcX+cExr0+oaj
	IcF/SeoDfyl+R7CfXu+eeAAERJPj8l8lLpmyTE0uNgRRPCHWlBVi1RAwCaCXQM1Va3gryJimTgo
	J5UbDfoMn9jx0pub/0rDooJLvci2crdRCE0bOjaWb7FzLY1xlrqn9wpsIpKArvSKqw0RNqCz7/m
	tz/AotwGHc9vToaArUKrzYY+PpfxlfU39b2Y875Zc0pd3rdbA952YQEruZ9awVdET8WZmFzI5fu
	3Xz0YE=
X-Received: by 2002:a17:907:6c0f:b0:bcc:e8f:c3a8 with SMTP id a640c23a62f3a-bf3738f1e4amr638949766b.29.1780904035800;
        Mon, 08 Jun 2026 00:33:55 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0522834dbsm815190666b.27.2026.06.08.00.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 00:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 09:33:55 +0200
Message-Id: <DJ3HSJ8UK5MN.3FWLDU8CG2J2R@fairphone.com>
Cc: "Ajit Pandey" <ajit.pandey@oss.qualcomm.com>, "Imran Shaik"
 <imran.shaik@oss.qualcomm.com>, "Jagadeesh Kona"
 <jagadeesh.kona@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add GP M/N clock controller node
 for SA8775P and QCS8300
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <taniya.das@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney" <bmasney@redhat.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Richard Cochran" <richardcochran@gmail.com>, "Konrad
 Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-5-1522662b6c53@oss.qualcomm.com>

On Tue Jun 2, 2026 at 5:21 PM CEST, Taniya Das wrote:
> Add the GP M/N divider clock controller node at 0x088d3000 to the
> SA8775P (kodiak, lemans) and QCS8300 (monaco) SoC device trees.

forgot this in the previous email, another kodiak=3D=3Dsc7280

Regards
Luca

>
> The node uses the qcom,clk-gp-mnd compatible, is clocked by the PDM
> XO4 and AHB clocks from GCC, and exposes a single clock output
> (gp_mn_clk) on the dedicated gp_mn pin mux function. The XO4 clock
> is pre-assigned to 4.8 MHz (XO/4).
>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
