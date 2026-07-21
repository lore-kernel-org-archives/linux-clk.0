Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B8E3C7DF5
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 21:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670333; cv=none; b=QR7UJrXt1enCT++VgxAsQHIH5gqA5v1lsWmxWe/bNCIGjMonA5AFALL9X9SV7MWPb+bCsiX8RqpPIwYyZxHG3O11HjmTBIwRGnQT5iJt4KLj4aArhlYg9QKxll9n+yXUsvo0a6aa9tZ9+iKVYlzwzbKezdbdyr1XuHKZzlJJ3Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670333; c=relaxed/simple;
	bh=qzXYqaNZ8YacH0+RDZBrFejwkYxrl4euPf9hs7+Yt8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omudTDaNyIaYj6Xd9lKjlh6Q387dH0erNyqY8wN2ZPwXpPE8mfW8w/iuKJsCFOkOoG8Bs2wjTO144QtlE1tWjpEBvBYSo+iz52zZwuqugTyyBZDI21818FUc6azkhs/gn/C3o7mFxX3sPB7zdehzcZN+2HFs1d8HDkHBTi7toCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BHn9bceJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gh6E+EKD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BHn9bceJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gh6E+EKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784670331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4/knV+I82RYJmpNZoc5ZNNpDHi7DOzo99Z4+2yaDWXU=;
	b=BHn9bceJGEymtvMBxoOp/rvTRNsiLxKw83XWj4BgM942qa/Impb6XllZLwbVpDvxj8vJw7
	HcULS+zhipRX3FKO4uywkSYz5Ro/K4wify9w4tjY5QvAqE+duX4TPJ3sNHM4TjpLE9WROW
	eTaOyxuExofiDnZUpXXvoSwgMX4pRRI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-wLK9wX9oOyW9jDVZ4sJOsA-1; Tue, 21 Jul 2026 17:45:30 -0400
X-MC-Unique: wLK9wX9oOyW9jDVZ4sJOsA-1
X-Mimecast-MFC-AGG-ID: wLK9wX9oOyW9jDVZ4sJOsA_1784670330
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso105816201cf.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784670329; x=1785275129; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4/knV+I82RYJmpNZoc5ZNNpDHi7DOzo99Z4+2yaDWXU=;
        b=gh6E+EKDOkf+X515twa7YNj2UI2cH5SNSGFn8a2jmZbaImwjQnt3lRXl1IKyvY0MHu
         cNCTth8wzx6SiCxSe2afPuvJRpRBvFBxtoznT8pWHnzLcpeiut51xC74yvF5szB+X1LH
         fq3O0naFqDcCBYS/er2+e265dIcvKig6QRmyDyvdgt9WZX2prddhslSYNbdoHy3HIiQN
         ZXIc8gldcBJ8aSkLdSv0r3H/PcJk86yInWLdiPAaOpxEEZdOSG47YTKP+CsReUPELrnL
         KssZRWTeJphHwxjNCc2m7YXT5iOBkKDbPuI+Zq9zAikXPhwwYak9pPCQwa9NaNdS9hhI
         ayZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670329; x=1785275129;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/knV+I82RYJmpNZoc5ZNNpDHi7DOzo99Z4+2yaDWXU=;
        b=lQ9V3PiLUXF3d48CHk4J+OK77jP2afDnl1eRGMCB5cbw/BvPdet2RIoCZcmVojFdbf
         jx7ptvAjWxhoC0Lg6xnrj849E5pmNfLfwUtYsNli/iBmpxmSMK6HgtBIumZZ/+DeL47d
         8whgAkLhC1KTUMO8EVouvlqxPzXYKWvVSPc5IVA0JIy4r3bwNxL+BIuQZnBweb834aag
         MzuBMMxEq8KWujfI1A2/GTVGzgwmfhmAcsLO55xAcZvpWSwehRSR2ibGdoTGGiCu2ewJ
         K8k23Adicn2X0bj1Wfc0TFvUlD2zON3fhP/qXec4kdv9s2gsUgP4EuRsa5GzRX0FFaST
         Ehaw==
X-Forwarded-Encrypted: i=1; AHgh+RqXkJD1TawOg+ngqx3Tbv4PagCK8HiR6Sc++tpPnazROfX0w9vof/a6kUXvtFq3gHJ5xkMOCecLBpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhlDbVZZAy0ngYfEv3Hx+e7ExwUjM6GhCeSkZvvSAJp1M9JA5G
	z8/R7/bdhIJcryure1EDN1KAhXGskYlpZfUinxBZ7dAePpajq6Rg8wM22d1Q6NW7RTh8zSN9oBK
	6PpSN28HZLxs3JURXbLeVmRQVrRluvO3EUXgfASJIZHXSWo+IBuWzn6hXeCtS9w==
X-Gm-Gg: AfdE7cm+oHCjpZppt4WR0MTEkae/AZE7Unpyr/17UxidBMpnCiwmxj3tOkptkdr53ms
	6uPldAFVzH2MUJx8UQ3lpLLiGyR2z8nzyaMIoYcBbq80++9bJMHy7hqCpYz+icsOzpHyUwuZPUV
	O57myzQPOE47dw3NUFnjMFkOcZWBir5pJrcy3wQm5V9eWE5Q8oJUBgaHEsSACpgPvx45qKvtZEK
	76jmCaveRUlhkb0hbkI4b8pgYhMAalpcosQ4ykcG5YJsUtyAxmpIbB8uZCyvqbFGfGG0gKj3zAe
	RyFHbl7tdOteTtWQP2o9gdx9O6nfpf2J9CYufMVkBM/eG9dA2SPw0NTZhjm5a6LiGcRR9ZI8gFZ
	fqzWSiUMLOlCW2xcvz4o8EizZiFBojNqU/tA=
X-Received: by 2002:a05:622a:17cd:b0:51c:7b12:1209 with SMTP id d75a77b69052e-5213f6687b5mr187303311cf.87.1784670329639;
        Tue, 21 Jul 2026 14:45:29 -0700 (PDT)
X-Received: by 2002:a05:622a:17cd:b0:51c:7b12:1209 with SMTP id d75a77b69052e-5213f6687b5mr187303001cf.87.1784670329212;
        Tue, 21 Jul 2026 14:45:29 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba9e13d1sm5679306d6.28.2026.07.21.14.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:45:28 -0700 (PDT)
Date: Tue, 21 Jul 2026 17:45:26 -0400
From: Brian Masney <bmasney@redhat.com>
To: wangjia@ultrarisc.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] clk: ultrarisc: Add DP1000 clock driver
Message-ID: <al_odvEwqk2f3h0w@redhat.com>
References: <20260720-ultrarisc-clock-v4-0-fe639d63bbac@ultrarisc.com>
 <20260720-ultrarisc-clock-v4-3-fe639d63bbac@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-ultrarisc-clock-v4-3-fe639d63bbac@ultrarisc.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Jul 20, 2026 at 08:38:06AM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
> 
> Add a clock driver for the UltraRISC DP1000 SoC.
> 
> The clock tree is driven by a SYSPLL and provides fixed-factor clocks for
> the subsystem and PCIe, divider-based root clocks for GMAC and the UART,
> I2C, and SPI blocks, and per-instance gate clocks for UART0-3, I2C0-3,
> and SPI0-1.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

