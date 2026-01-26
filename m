Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC95B2FF646
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769417587; cv=none; b=V7y5o0U8OeIZrsU2sFZEnSpBfgEQ7CQ/ozt0mmN2bZbPZHRYQIgU36A+8DMB1zwKvljC6VH+c4Ho/17UfmxiI0L2HjBJy1uh7x3TH6aSK84SxRV14Yl/q6rvYw3Q0KHT8dp/2YyyQwhnrBB6VRcL7nlwZ1rG/4x0C8E5tYIk1WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769417587; c=relaxed/simple;
	bh=0eyrrSvMw95Fsfg45weZEMbWcEa1eV08cJ0kUS/1ZOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+ivWZrEd6JtFbMvRwVsiaHURK24Qgy5Rf3QKw/NFyWNCcE5vkKnrjKCWoEZec0lidrtg6pu3Tpu3x/TGIl0uVXTJcAvltErmmj312kW6mqcddmZ7d5NXjTzpldNCPO8HNIU1A7O9w9qy+IQyFjMj2BDIlYo1NI3XJRnwx3RBI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pkQJHNDu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pkQJHNDu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso32978855e9.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 00:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769417584; x=1770022384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7jGzhFWIZ8jRzbCcQfjDKAUo+hlscYAz5XQrdnrI5ao=;
        b=pkQJHNDuiksU0yeryU0X1uwiZ5Wket1/tFdsD9PIYE3hAUhWWwx3qs3ZtAtSTGnf9w
         WvTDdn7qBlZf5ujUihlXRW/OK9yc/Xm72ZJbj414p7NCt9ZOy6fbrB8mHfY4UjYFW/DN
         JJUy6oW6EdHWy56FmjUDrkvvFAXLteLqPh+4MlhfLN574+zvo5zvjtlhnmDAs5pBlF3H
         FtOhcl0OA3yFwIg9cJOoLgqQ/EiogKTdEwFjPEE2/4PiWz82BmRxDSl21K2/Fo0b/nQL
         BIQNuuDy1Msf6d18JpJc0VOFszNMVZyvrD4evYTCVM7wRoDbXogjoDRKOrP5jeygeePl
         TTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417584; x=1770022384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jGzhFWIZ8jRzbCcQfjDKAUo+hlscYAz5XQrdnrI5ao=;
        b=rjym3elH1AmLEVwN3BizP0nHs/Sr+bUnVx0LmJ+qxDJ3S4So38FWjIew7X3/FiafGP
         yX0sF2oEtaeQoA5/tX9PhTZ8xdMNYG6rG4EpmegUKZTM9Lp3p9skD8fh1k4C18v/Lcx+
         SJ962htaEPEWJoy5V1wbTMxtbbydnmhaBl9pnAugRQHLdMu7SguqCXfPrOv6EEHEocAE
         amsWtaatpknAyQfx/F25x58eiGOlzjDv/rkXEtJXMd3ix9MTLuHiryicaG0cvsK8E4Pb
         PAdg+g2qqlim7tjuL4DSUfv+3dZPhlkLQSKEGoisexlc2eofD89ptlmhHVYXDgIc/Ced
         mSXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvvmeAZHFqj1fB2SpflcZSGHf7vg3Bwpw8h5a1A1oe57EKU8GuMHSC3gK+5nO68j/SDCD7V3+olHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzkkuySBtpzu1AzwnjvL9KGzi4XW+1I8aWw3nG1r33CkykWnUw
	Rc0NQMfwAmJRMsJ/mKrSeWVZL89iWeOd6ZgMPluWC2NhvfqcwDMHJg41p2PF6d0w65A=
X-Gm-Gg: AZuq6aJmSqmgKuXkpsLyiumrXoqN7o1n1LyFEC3bys2pEmpA8OYqySM3kCubPgGdLrp
	x6VVAU0QvyjO8/PFIZsbtiPfHavKk+l4Ifz/FGaKY/28xDpHDmAlwpTF6zOk79R+GLi+HuhejaU
	JHR0JPERA/IGsPuESwOkVy4ZgadA+oWZORVLTELCJ8s0d3fi4//X8EWCwx4/BLzmXSrd3bia2nz
	wTbSOc1V0kSRibmHaGOEfZsC9egJjDhYBol2FYBxH7CUAHBHmdA1wkv26pi2Sa5cfmFC4HPtOtJ
	LU6LqzEZmBzey04QURc3ej/4hfjGmfqYTWMGeC1w4ys4sgqRfP5LMq0RxdGsaLK0fCG3qvfw+Hc
	Dfm3OlGQAQAaDLhmN6BR6XvhoP09Hm1JUvYlPA+HnuzAjpxq0diUu8CrAxjnGleCqJsKS+QEdqF
	tT9phUq5SE+nNpA0Df2A==
X-Received: by 2002:a05:6000:1446:b0:431:656:c726 with SMTP id ffacd0b85a97d-435ca124817mr5395609f8f.3.1769417584092;
        Mon, 26 Jan 2026 00:53:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7ba0bsm28791612f8f.40.2026.01.26.00.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:53:03 -0800 (PST)
Message-ID: <10329006-dc97-4a1c-acff-cd8d583f2678@tuxon.dev>
Date: Mon, 26 Jan 2026 10:53:02 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/31] clk: at91: clk-programmable: use clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <6139b579434c16fefacd3635d2c7ea67b9ef7822.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <6139b579434c16fefacd3635d2c7ea67b9ef7822.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> Subsequent patches will aim to completely remove __clk_get_hw().
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add the clk-programmable changes to the
> SAMA7D65 and SAM9X75 SoCs.]
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
