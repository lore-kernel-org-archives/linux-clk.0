Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290A23002DC
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468670; cv=none; b=M7QcRvdJ8l/s2tDwlTnPYsIw4D5vuiyS6oKXV2PPvrjQcvTsl0V+ZFjqyrQgYIvAccHwyI3ZmtSY6qR8eqQxYdtIFNM3cMuozcohL5ie1buriubNphlheNi2ZvakNqR8ibdto0Gd5leIiLrRnw8vmiU73xDHq3YPXRcJJybGpB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468670; c=relaxed/simple;
	bh=KUpWza/RBTivHIVw5LUpXLgkwpdnHe3OOe19SRvS6UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H2jzfK5iMmhueGCvRcATsfJnjy/5URIteVTi76JB2+5KH864ecWFu4dSqYRa9B++XsONmoVPAJhWyEUKcPnKZVvvOc5aprvctVOif4MR94pK1Es4O3LeZiWpuWtTZAhPXWPsOYqN14E49xf9FBnmWC9EnVgO+oUgBRTAS0oVo8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NKTC15BE; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NKTC15BE"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65f767a8d62so8239636a12.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 08:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772468666; x=1773073466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfssTx/ZoY0j/RX1wDHgwFfkiRU0VpOe21pXTWl5HWI=;
        b=NKTC15BEIE8R3SGXehqnGvOjZfdwwyZg/2C8QL19QtkSnF96tqwXqD9TwSFV9eTjCN
         QxC293PUiugrGOSbGiG26yPfraFdND7XJi9s1P6rcXLRhbl6Zflyospw2NvcLPBFpNxB
         BUvKnB5CV534IYhehKLGzLfE5WvSr3AhpphuI+ROQwg61yQz+piVe7uofTwzCjX74T9W
         LG8S56NSeX5Su4n5HcXSp6MhacNMUiAgzErF0QJagNg/gtZTOUsKHDm5H6RbYg19wWXD
         JCGrYNNMcfyjRr+jSSon69VLyFTSIsPMXqnIXW1fmNO+Y6zqZJeGfcY9cPLYnVdqiKCQ
         IBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772468666; x=1773073466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfssTx/ZoY0j/RX1wDHgwFfkiRU0VpOe21pXTWl5HWI=;
        b=JHOZfP16a4mnQy5txNL3R+nHQrH6ppPUNcU4gDjdP4IJ3XlC38JPE9JLQ/OaFrSnop
         solahp3dBwqbJsM+3PWIkrbfRDx22L5tzSkiVfedZsc/09iQyEwK2IG8W2S8zgjP5Tbq
         f4z6CnEeOQdRKI3cBDH412KE+YQowskSPbwW9eQ4qQR4rLCudBqY9LxIaYXoCKzITOM/
         /uZy0bzsrWUaScMPcxFVzRc3ZRIgYEa0eUYDjQt5Q9fj7uY9Eaur37MCGPVnriynekPu
         vjoIUZrUvpUyvSrd0JkyDFlfVP8QjfMu2dSqtjroUZzUvnwHzJKtGNXYY39i3/lr5e/a
         0WTw==
X-Forwarded-Encrypted: i=1; AJvYcCX0uIC/5RxYrt6Sg+6912s7uhZaHGUI+sz5tIFnc8m3oLqGmk5RmMrKqUZeTjSSXTeZ3yz/dAPZZAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqmvfVJbqrLAaF9eaOrvMt1ltcj99bsnzxifbSZeOJH6jbSDXx
	Iavhs0vNVesn1T0yj9emG7aPuUrjqWBvb6Mwq1RHxASTysJEVtqiu26kdIMTB1+lE5g=
X-Gm-Gg: ATEYQzwJfeMd670V7H6TkrD966qNgLwR4GMI+pfaSASfHgH2GcAcrTdgqYXKGLEDMF6
	DOIqZoqvC636r0hrCEvQ/O9LFRPJOMyOMzhMt7dP7KhD41Uo7Zkau6RlBAyPFzbtAD0sz2TOpYj
	VAUUxwqLhKfle9zl9c37lH9ffUsPhWmRD3j/wvDgBfUJijYVIK7bMGlPnd8zIirw5IQ+AGUnSuo
	ukmF0/kH8+0zfFRiiA9i4iz4dhkKTquD6eMziXT7Irxb+0y1f+cHz75Bv4rtZ9b05eEFWsIkMNY
	8sawKfap/dRaFBGn1zCbzy+AV26LCGTHxbvxTW+cMOcn1oUNqW7c7jCzeBBS0NsldvoWD+I0+NN
	eKUPGTJjpG0WjXQBC9SSV3NhlHn1M5fnRtRSPe6PfV1MpgvTTHPaujY06vQp+NCWlgj53OEUE8B
	YNH9En/kZo2olYZLelzu7KDMDh5a3qAm0EzveM
X-Received: by 2002:a17:907:847:b0:b88:4efd:6cbf with SMTP id a640c23a62f3a-b9376365c63mr912505766b.12.1772468666419;
        Mon, 02 Mar 2026 08:24:26 -0800 (PST)
Received: from [172.19.170.194] ([213.233.104.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac66feesm489214566b.21.2026.03.02.08.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:24:25 -0800 (PST)
Message-ID: <dc69a0c1-15e9-41fb-91a8-01d4b4188b3d@tuxon.dev>
Date: Mon, 2 Mar 2026 18:24:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe
 controller
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-13-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227153236.55988-13-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/27/26 17:32, John Madieu wrote:
> Add support for the PCIe controller found in RZ/G3E SoCs to the existing
> RZ/G3S PCIe host driver. The RZ/G3E PCIe controller is similar to the
> RZ/G3S's, with the following key differences:
> 
>   - Supports PCIe Gen3 (8.0 GT/s) link speeds alongside Gen2 (5.0 GT/s)
>   - Uses a different reset control mechanism via AXI registers instead
>     of the Linux reset framework
>   - Requires specific SYSC configuration for link state control and
>     Root Complex mode selection
> 
> Signed-off-by: John Madieu<john.madieu.xa@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

