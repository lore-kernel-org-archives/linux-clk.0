Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771054;
	b=Ep1znxWfkTllAunYYnWUCwDDrpz6TwZk7eQs5AOvPYPurVX0o+PnW1C+5yduMq1tpfnB
	 5AAmLIDJWi7OtPICVy4Qvsd1TcnjpqsxJeFIZnyFO/5ENMcBD2dqm82avwkZ8SYd4TLEz
	 ITYa78IzF+9k9fnKvjdWglHAXLvLiB4K96hIuptB0dFV/92pyDIF/Qmhq2llHnnX11rgK
	 sm/RMGRxy9MwuYNY8YOOPIfNmt+0IOD+SCqrvg6O6WBo2oNKf3GfwmQlFGGM8GTnvwLtq
	 JF3hENCY8kUqwuwOKmMp7SVH1IlwWQQDHUgozqrP6prKRBHsLs0iK1ARP9sEDFCm20Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
	b=TY8vl4HvF+8MAmEAS3CeycWDbY61WS6ZMXWUTfFjEC+JHCrwPpwBY3+lujE5ScFpPZnH
	 Bz36TSEIVxYDkyGDRRrHsJDAyob4HxHXPMs5CvTbZRhJVkRLzob8j8lwuICLuiSemT98W
	 s7NxvjSH5XxpOFg1a2in+9BAzv2W20NE5PJoJ28r1Gw5z76t7zJLgARIdZReLonR8RFZO
	 O1xyP4RevmivVZDxtWaAUT1t41NXbqQH2LPhroTolAoV93Oi74u8RQfMSmOiAIy5XEbZe
	 BQOuG1QHMgnDry46fV2gAwurGir5xKZlf3iY+0wJ+ANHw38wJ3S3+SB5K35H1pDLJMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=aI0lqB3a;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C3D606A321
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 09:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C3D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=aI0lqB3a
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b467581b98so75726805e9.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 01:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771051; x=1796375851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
        b=aI0lqB3aCQ/4qBvwVRrDv3T2pKd7GIXvwQaW/Zh+LDPEWa17gOnnrr1BRlBIiBDLGi
         3xPfRxJaZjTyG/xvFc3dneK3xD/vNNrfe7lzCHKDtGApXlb18j3sVqNfkNpyZlK6n953
         YXQWqBLq6DgnAMebNL03Z+0dRUS7k1lzTKtoLXWxp18A2ag/Vuu/j9v/pXqDglpge3+U
         0aSVeDRd0euIBB0pClkJqh+3k8ujN4D7hiwgn+JHi6wQmvh/EL4Kk4CFcoCmmj/IueNy
         dsgWcm41bUvXD8zNf1yL+83BWKY+VC6T4IQuzt9lZYBAlNR/nIKXUaaUworjOtwk/D1z
         Ktag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771051; x=1796375851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
        b=jlGTUQTsiu+OFYhO0nO0euDZHt0s3TKeMdlhmcBEeHBk5bbYdObFigy3PFNQyRpSXT
         kIwvH8T+3/gYX2LR/dJTrXJYu61XfbcttdLRzGSQwGTOHh20sCDZzaEVQNVIBV3lssmN
         X8QsePLT0EccfWnPtwOXIX4oe3gHrVel4RVCg5p9cn/GzHnYiA6bYkpAnEC3uyhR6Sly
         8o9wSxJEKYtGbXV5q6tXJJf9irhQiR+cTXGJoqfUZu/ybIfOlZRJh9+xOQMth19fPEuf
         sf1CL+J1LE7gQEi81Gb+6rWcf6bUT+ZJqk4MW45wa+aKSRzYNvQkUWBgYamNyJHqgRpG
         uBqw==
X-Forwarded-Encrypted: i=1; AL+hErHKYvDtLLKjglCz24R1RWsa5ey4LUVZZz8OsIVx7FoRrRJw9jJFNHajLARmyVaOBOYlibo8tKB3/E8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m1r5irMPlho9Ibat11qSmpSpddccaOSjsxRJk1Rh09vn6g38v
	msOtgehWuVvu0zYJ3F5OfyDbKIYLj94wirsJqdgbLlheHnOq4EPWWNzQR5MRmMyXrto=
X-Gm-Gg: AZFdTZekV649yrk3D1cy+C+odIWlNlQ0rYh9mnZjYQS2THYBwYu2K42FGmNUP2HWEAe
	f2HdHnV0AjX6DjPoCVXZB/7t3sngNojaDn9AKTkDuiOKVqDmHHSpk+Jb3OcuHafCpIOI3tj62Df
	hpWCDaxYPI3yIvnDUOcnxK2330ygcnCEmWt0d5eekWcolp94Ub7zhx0Nrm1lA928zhRFJ+CVnxM
	oSE0sT6aartoyvZBSHX5TVsxJ1dq8jc6ixrkSbqcWSk4hn/W2aPQ58hgzcO4HGrtkCc8IthQ5IZ
	0iMH6ARevsz4GM+8hFk8HgxsFxPYSTWrdDxVntF4NiUvm+b+kukoFdov5nA6uzw1hhFnXnmDqrT
	+Sxnoas1KmcA+M8illjpWcHRmnBsAgOeGpby7bTT7hGs31x4DLo62ZC88cm/G1xX+Qp6EscfHHp
	4hZftdUenE62ycKCQA664bvsV4IHWyP1Ky8ffgnoeO6GK5mXq6trDwSXz4ovHy8rwcabO//Wq6t
	tOtdKzjJpQBXJpKufU9FNWZIhqjjSVU0Qm6v+Un9ZWNpgLpjtonwYmXOX746QiAaajw0dVf3nC4
	Ymk4sAEcSkcXZ04X7M0KpyNdLZ3RXB9iOWjF
X-Received: by 2002:a05:600c:1389:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb88826937mr438432725e9.9.1795771051464;
        Fri, 27 Nov 2026 01:17:31 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm896151645e9.0.2026.11.27.01.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:17:30 -0800 (PST)
Message-ID: <5c05644b-fcf2-41e7-a012-338ce7eec8d2@tuxon.dev>
Date: Fri, 27 Nov 2026 11:17:29 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] i3c: renesas: Drop comma after OF match table
 sentinel
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-2-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-2-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/26 13:35, Diogo Ivo wrote:
> Drop the unnecessary terminator comma on the compatible table.
> No functional changes intended.
> 
> Reviewed-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
> Reviewed-by: Frank Li<Frank.Li@nxp.com>
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
