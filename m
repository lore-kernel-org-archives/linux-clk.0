Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3773741C0D4
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468947; cv=none; b=sq+8x6DRK1blbY52+X/CKCYv7aMAmzyTpkASqYXyiIhFKH2LZi38luEY0WherdN/ST6BrHoZXpEZUlF+1mEpVllVWqfrnGYIyCchmE5xbrOBe5XTgkcmuT5H8mNEuBUZ5SLbRQsvR6XBAsnRx9dMgwwDDtJgvuGftlc0TamMCzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468947; c=relaxed/simple;
	bh=6zebDHH0MXAjRuBUob2liKRQwdfSBVsejIj+VytuWVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtXySyMg3H3twMNUko5Ncej2rZfd1728gbPtWnZT5SQYkH7vXihIJApc4SffbNuyqSiHQ/S8aP7kASswRQvXw0Im3jvhHzO+A6xvFtrHzqJixQ7Z9ghLH/Ol+acXkey6+dq8Dm7xfcqwC25fJeN52be44xxKdcbTuIQ/Zz6cTVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kNr4l72T; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kNr4l72T"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so52857985e9.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 08:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772468944; x=1773073744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZzuO+V2q2Kb9c67E3GUSaMIdKWjmbJeyWojduVxXxN8=;
        b=kNr4l72TlIzHpDTnHn2g5qcBw2isibg03krsRvb5hCGWMeGiPPr7JAEPqR+UGwuKqX
         5X+MXLkO62iX+qWmLYu7IDNTH/EcwaoEABIltKNNAYntkURcpel1f8paqb7Gpu1+hmN8
         X5X80c9yN8urvS0V2Ms2Ptkl6JfJIiJTtD41mR3z2dYw3eExlJ+Wtwm1IfI4Jw71ll3D
         poPU2z6LAfFTqWa6zYQcyBqVci/9qrO5sCKORYcoAgIPEgt5aCrqKXAeyZj8OVFzkPPZ
         hgJQe+C4ZVJTGequltszX7+MFU2+ZFUpM9gJRQ+RyBNFbMhuE5VwMyOAGR70SNZOFrHY
         1p1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772468944; x=1773073744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzuO+V2q2Kb9c67E3GUSaMIdKWjmbJeyWojduVxXxN8=;
        b=kNb8ZD8+5Onr8cGGbn9Fck7dlFExWypZh9CvXZJQV1+t++586ozS18SLNwhH6oyKVD
         Fq58La3nbkZmSjFsVZCAxvd45a98q25RXfPpZVNNTZhLgjA2+H0zom7wd/6bS2MWwCiw
         Wrf7/Ryh4KMTQ5GJvP13z6d6UrUGU1UbsPBIOa/noOuF7uEGbWDj6MIJ8XF4RDgBzakS
         UF90qjpa+WAJs5dSOuCTHaJUrN5PrTSfMQR54WsO/mQQDOxv6R8m+fNck89EW6qU4QIM
         vX29ra7vU5OmllrUPjdZD0Qkyc5A6ijCZYw7ysbLtbXJdE3USFiyKyyoJvtUSTvd8woA
         kcuA==
X-Forwarded-Encrypted: i=1; AJvYcCXoQIwBM8FQRkzo9+ds08IRqQeWUVuMwQk052BVvfIvtAI67BqPh27XSsln/bShJNu+Q0mFRiiCEDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbIwCOO7S4tkwCJ5Wk6/qI1H1rusDens+H6b+1UduJyUQrBuhv
	om9g8xRh2FdpFkX1D+EHVD6qWCBwOG1Q1crjGS4Kz/q686rpr4GMShH9Po3VrMJt7ts=
X-Gm-Gg: ATEYQzz/UbcVGoO5WP/VXNOnneNRP6XWbAQDf2gIuIz02y/19h8+eC3GUhqDmdLz36V
	wjao2pTbLfIJ2aJ63QVZEm2cYvBJkNUZ1Ly7EAytRjXCnuAvR40hHhUVc0I4nGol4uQAREBSsw2
	W1KDSqjfApRgkwdR0XU43J0rcY9H6ZQly/2wQxgpkeBcb7HrDT7OK0IKqsrEdVZ/2eIFXp4D5Tu
	O9tvFkD5iNZQkmgYq5IMR9wig96HM6hmmQSnbVkboXAf4IMjk2kXcNmAAkX2ZHMrhJry6x9m0H7
	dgCMVQFuJ6iHS+rjFP/uqQYSFg3lmY72FHlNyoO4TJEc9QJ65Umv6mdsX2KkdaCNRAR4uv0zLB+
	qJBdgTVFnuFC0sc80mumiUV2d+HMHRYZGbQFcw+8hM5+Eo3UL9dyebnPMovr7scmXxKnxnvusxe
	UmKQrpYTyqY4gvIv15kyO6b+i42WokGHCfcegq
X-Received: by 2002:a05:600c:1d06:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-483c9bb1e14mr220375005e9.11.1772468944495;
        Mon, 02 Mar 2026 08:29:04 -0800 (PST)
Received: from [172.19.170.194] ([213.233.104.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c35910f1sm248099125e9.2.2026.03.02.08.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:29:03 -0800 (PST)
Message-ID: <fccb529c-28c9-4393-bd35-921384f4307a@tuxon.dev>
Date: Mon, 2 Mar 2026 18:29:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/15] PCI: rzg3s-host: Make SYSC register offsets
 SoC-specific
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-8-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227153236.55988-8-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/27/26 17:32, John Madieu wrote:
> In preparation for adding RZ/G3E support, move the RST_RSM_B register
> offset and mask into a SoC-specific data structure. Compared with RZ/G3S,
> the RZ/G3E SYSC controls different functionalities for the PCIe controller.
> 
> Make SYSC operations conditional on the presence of register offset
> information, allowing the driver to handle SoCs that don't use the
> RST_RSM_B signal.
> 
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

As I didn't give my Rb on v6, but only mentioned LGTM, I'll give it here, for 
the record:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thank you,
Claudiu
