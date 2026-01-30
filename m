Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4023A30EF94
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769781208; cv=none; b=tUavOa5G1sptcMz+iCTmLe0gnPJjadvHFKZ8ez9ZaHTqpQOIMc/4tbAyF4nv6qbODF7oOgssKQUtvA0Col/T1nVhZKACpEkBHZ1ipSofBj8N6CEiS+t+Z3p4VkoTe2FyzYAcjZGUAAhQpULSoe7OTNvtQ/N1pueu4KK60hk1bgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769781208; c=relaxed/simple;
	bh=zXXCIiWd1aTcZ02PDg2t9frtKz0qB1Gapb4nnXth2zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4IEHe58fBPT4sbh+Te8VC8wKKNx+5uyxi1tWlkg3qvhTz3ikzVdi8Rm0RWyFpExBS7p5TJcUvTU1rpLTIhD6TLCym954xJRkXNwdp7XVKG25wd0HHDjGoXIHQIFlJdFGCWGd+XnrG9Nv+xE9P+AL6L7QEi4fUDURUEz4WRwmhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ebWxdQAx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ebWxdQAx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee07570deso18314025e9.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 05:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769781205; x=1770386005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4o04psgLUgXFpASZX7kNJzQcWYqB5cygy+rbJIoQuwI=;
        b=ebWxdQAxmXB1uKGQ+VwDCzICNWBdd2wVb+i7lLKS5ozbaz9SW4TzE9B37zhS9yrpsj
         YzJ9UsQGtwWOYP1oTc5+h+27gxpkvYxee/2o14kjpraR44v4PV3WMIG0U7hfNg833jcS
         w+h6BGb3Eo3d2uZj05tM9wIhFPQkmgGWu/0qACZiI4kgSqbyz+JJTqhefNiZH3fDNipx
         g6veTx+wH2w+hX+K+6tyDEooi1SbSPleCTAHCCMMDRdybXkwzm7ReT0MB//WN1knEqVt
         OWmLMIixxCD/YdnEpWloZ8MNSxJgNVVUgkEIIrR9KcExcZJwU8ugk4ZDddY/l6vc/Fm5
         hRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769781205; x=1770386005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4o04psgLUgXFpASZX7kNJzQcWYqB5cygy+rbJIoQuwI=;
        b=c4DW9Qt9W9q2Y8Md/t9dL8zTXlToBw9JdL9eCYhF9niNGVEEi6/i3g9EhDPL37bDaa
         4tnO8AAl9vAyBqVp8M30GZ+iqcFKHvWjzXofilMU7NONjjnbL58rYBPUGPrfAMVNmyii
         E1fx75Cz3TOYXKmrmyrl+zxMjbbJlp+Udl0hMVQsFTRWzjZcQ9sjo1QqutlXiCa8u8dj
         1vCVhX0D24VPZ9EVn4bqLl0UZEMcbV7aukUu2b21MAlYDQOo5j5DA3/SawJc8ode2yOb
         WQ8hXIYnh0T3QKO4IAZlhcSsaqWDg5XeOmQpa9ddmO8aXqQK+cootBH6zRRhbY41S0P7
         CriQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLa+Dd7EonaTPFDUEbUWheGpfOoUIKI+c0wbdR7x11c9v/u2GwLiMHJ/+EIJr09jQufCl/4wUavc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlupUE8GJ7lwnqRTxBZysJsCiEyxNLl73PcuPK2h0kkLkdLJdb
	jf19yfgtaJybDXH+j1FTsPGV6Ud4XDUCWPA/8FFgdNSBEsYs96hr7EA99C/YPJkm0WM=
X-Gm-Gg: AZuq6aJMdezNLztvWiZHo7tT52gEJInuHD0JgKdpdjMa/Sow4n1JA0t4Dil2lQv9IUu
	pQbvuIHry6S1IaMrMEoHElcCu+dQyHzimbQQyLbEPUFo40Gn8UrPp071g9fVhHbjlHk685jK4Wa
	jeQ6qx3s9x8l+K9XWxDCibWH8mCGUtip7jfJ1akRX6kR42sWDFX8QgEhZHLH324RAMu9cCCGHEO
	Ru2QdmAR1WmaktN8+m0OzNkzaDEeIFNMjw4akQwCPdQyhNzb72zPS+GcLioDLPXM5LidunmIbtB
	R0FZ81ouLTgjl5Ca1jKeGAbBsukLZdU9OzbglEZ83ViggxW3WlgcRyAF4T3/WQcDBzQQ3geqb2X
	56EKoBv9Edbnxz75X4m3D7j1AteQUy4hO5TMTAHe5peSw4HpxvIXwDSEnd5sVNIXpuNLeDwvBB+
	CuhQoOLLfNPL1rOcuCcA==
X-Received: by 2002:a05:600c:3586:b0:477:582e:7a81 with SMTP id 5b1f17b1804b1-482db45237cmr39757035e9.4.1769781205391;
        Fri, 30 Jan 2026 05:53:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066beeaf9sm281652035e9.6.2026.01.30.05.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:53:24 -0800 (PST)
Message-ID: <377dfea9-83fd-4e76-b469-c2336118f964@tuxon.dev>
Date: Fri, 30 Jan 2026 15:53:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] PCI: rzg3s-host: Make SYSC register offsets
 SoC-specific
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
 <20260129214130.16067-8-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260129214130.16067-8-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/29/26 23:41, John Madieu wrote:
> In preparation for adding RZ/G3E support, move the RST_RSM_B register
> offset and mask into a SoC-specific data structure. Compared with RZ/G3S,
> the RZ/G3E SYSC controls different functionalities for the PCIe controller.
> 
> Make SYSC operations conditional on the presence of register offset
> information, allowing the driver to handle SoCs that don't use the
> RST_RSM_B signal.
> 
> Signed-off-by: John Madieu<john.madieu.xa@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

