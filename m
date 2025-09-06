Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C893F9FB;
	Sat,  6 Sep 2025 04:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757132175; cv=none; b=SC4nT8jXD82myG8gQHDPMIYdEoChoaZJH2CdAEu/90YPo3rnqesx1aT+Kc7VFDNlC1ZRbEQntkkOEo6U+bpKaBemVWtoP5lzycY3rWQBbCtlc++d+QUSFfc+C++laUGsOWv270ZJIjR9fBKTf0eZItqQkOCdOFdFM3+PkVta9S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757132175; c=relaxed/simple;
	bh=+AaGa4KY4O7VR1L+5lz7LhtoM1ACUjc5l1vLXnV94tY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L7ZOkvh2AWfAvzqJo0w51NTzsBmPbjAZfaYpCJRPFdcZTwMUcZStIZPmlJhBwVxbu8YvRxIXe+K7nVK/ENN7pAGLV3pg/zamdGVt1/TwTpPUVr2E/EAzrc4ih2J1GnuVWboOWoUdXs0lH3Szbljs6f6LexaXGwPeBusMt2yl4yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f76454f69so2638527e87.0;
        Fri, 05 Sep 2025 21:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757132171; x=1757736971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+AaGa4KY4O7VR1L+5lz7LhtoM1ACUjc5l1vLXnV94tY=;
        b=HKK1ZBnPsz+GQOJ7s5W5QOJ6V8/QBKWvS54Ir9j3HudeXN1otxoV/f9ded+x68eT44
         wPVTJG4oNsj11GOoGjdcfd+gG5biP/rsQknUiW0MDgsLfifnZ4lChpTpDHZmhuheIsVy
         1v4zsNgLBCm4ZY/T1rAEJPZTsj12spL7YjxaCNhHLjB35xyRjxZ7ed9rFakgEIvI4Q2z
         CnFtyjAILOT2iEBQs67mVFlg5Pswfgxpd1UmbhcNHONA8MktyCpzzxzxJrnfiVo1TXXL
         MSVGZqk8RwobfUSBi0pg5mEggg3MuJGgXilA7SCkaoXVT71s60Fw2mMUYftkYhJGlJ+q
         nL3w==
X-Forwarded-Encrypted: i=1; AJvYcCUGyIhJ2hm9F6rJahfvekjn+/5iuBNcEtGZ99dd8lTBbGJY4jxoSIq5aHmBUwCZ2iNymhHo/l+i83a7@vger.kernel.org, AJvYcCUI3xhr+pO76G2UaUGZuAXtRyDMWy9pnk+DV5A5jmJDBJvNVTYvd3aA62WejAqFz2WWHq9SS/esTlQe@vger.kernel.org
X-Gm-Message-State: AOJu0YzZxlNdLwkh0FQGMHeYtQMMDAPYkO7BW7ltHpp/8wiF79Pn4KsQ
	29399RGZA9tukE3OVpHMn+bru8krj4yLqOBjuNXf7oy2GNrEMk4ayk3Ya9IupnSOniI=
X-Gm-Gg: ASbGncvAh/ZJXomDNRZpJBIYi+26NjeQszqa+NgnwqYak7iPvSKhLz40NSSoNivsGQW
	/ZCbiIcR3rI4a1UpT7mTtdeHSY/ApfBzmVgpTM8WehBLDQLeUj7aq5a420qNToBrnIFlDjMJ08J
	SnYoHZhUFvXoaI3geBuHxi5EgJqZlx7ZNfA2MGr1fJG1jb+DN8aUQxM+ozVxh4WaW1Yl32I8rV7
	fEhbjviUJhjxwPiqjRQzvr1cjj+/0OdeCv+6DTAHEqCPdbzgZ6HeSmEQIaxT4EUUeRV2ELB8Jwz
	eqGdo0FfLzCf/kNrJdBXzoXuKevYgom9ELTzul7w0O8wnMLxW/kxGO4QZZndGmZ5RleVctHaYGn
	b22gkKvVZrfGFmYREom6Ly/ARtpMpqN0sggFzHo9w191p0GGpL4y1TeI=
X-Google-Smtp-Source: AGHT+IF3qwMn1nQcbUBPY8R4JeqWSjiErGgfTeBHoJ0E6TP6+8bpKtcu7s2KAiiMU/DhLfa/I5Wp/Q==
X-Received: by 2002:a05:6512:3b1f:b0:55f:687f:d1a6 with SMTP id 2adb3069b0e04-5625eb95fe8mr375213e87.3.1757132170564;
        Fri, 05 Sep 2025 21:16:10 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab8e95bsm2109927e87.34.2025.09.05.21.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 21:16:10 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-33ca74c62acso368791fa.1;
        Fri, 05 Sep 2025 21:16:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW04D02gFK3wUj7JJwaYi9BKOf2Dk+26t6+ChXqV/CV+rtA0INNQUfyqnkLL/+wCagKjxu7G13mnAX8@vger.kernel.org, AJvYcCXlyWmfigyHOl7NGRe0iunAIwaaouFffRjxH9iGW2GrKYsH37Ve5sx94zHF4MPis/rLgoFwQbL5Za/1@vger.kernel.org
X-Received: by 2002:a2e:a547:0:b0:337:f786:2f4a with SMTP id
 38308e7fff4ca-33b4d8cb2bbmr3431571fa.18.1757132169950; Fri, 05 Sep 2025
 21:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903000910.4860-1-andre.przywara@arm.com> <20250903000910.4860-3-andre.przywara@arm.com>
In-Reply-To: <20250903000910.4860-3-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 6 Sep 2025 12:15:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
X-Gm-Features: Ac12FXxA73ZfGI4H5Rgtw7dq1dOBGNO-B8ktFeY3H3nm-PBpHd0UB2GulbKMsHM
Message-ID: <CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: generalise update bit
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> A few of the Allwinner A523 CCU clock registers introduced an "update" bi=
t,
> which must be set for changes to the other bits to take effect.
> Of the three clocks where this was used, it was always bit 27, so we just
> encoded this as a single bit feature flag.
>
> Now the CPU PLL also features the update bit, but puts it at bit 26, so
> this flag trick won't work anymore.
>
> Add an "update_bit" field to the common sunxi clock struct, which takes a
> bitmask, so we can encode any bit to use, even potentially multiple of
> them. As uninitialised fields are set to 0, we can use this as a default
> bitmask to set, so can OR this in unconditionally.
>
> Change the existing update bit users to use this new encoding, and add
> support for the ccu_nm clock on the way, since we will need it there
> shortly.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
