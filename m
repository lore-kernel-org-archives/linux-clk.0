Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D05A40802B
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 05:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789450008; cv=none; b=rbdzgmUUBCXMjPI1CDdbj6xOKymi75B6mM/BQuNgVPuNSIOaj/lrX6jtsVECEUsohW7CQFIH72jGtfzGXlypFqfEcRfs+8/V4NJRyWgpKlkjAjVfOGytHP31hsmX8Or4me37NnRtLkg1QhwpAD5uNSIW9igbVsfXXz0TIRZRkMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789450008; c=relaxed/simple;
	bh=vbzQq012R+ejKYv+RlREDKeINIqzcTFsS8nbpKDjfuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XA/dvB331u65xDpQbfiG6OK9LcqtJ4DnKvZqlOvuUlKsWp4ULOjHPmtlM5ciBzDe6yKBu3Ypbe6DGyyX9cCbhGvSMdMajjop52yyB9uK+482y19T6CH5p/qsqUsed/kijOo+AcLxqr79bDbMyQzTjS4hyooHPF4dIugJZjZs7Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLfBalj4; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLfBalj4"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e211a0so2572978b3a.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 22:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789450006; x=1790054806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbzQq012R+ejKYv+RlREDKeINIqzcTFsS8nbpKDjfuY=;
        b=NLfBalj4BfZCD/b2o5nqg/+zSMQdl35l4ZYTEVeEgFOTeJGFYK/MUKRF6KjWnyn/25
         LXFWz0VwTWveiXfFEqIxtujuxkkf4qvDBJhkvaSHxqpIUkFOb1yRrDEn7DcwU08wWqN8
         IyWMUVCPUdQM9N6m4lumHcITDqddrtBZRHKUcE3IuU/K8q6tXA6SA2AyHQNoGIPex5ks
         GtKsrr6T/lyw9Ov87Qbfa/Ki/2rmRxXUd5hEFlfjYT6pszaad7AITGaUGZQZMI1NaaAe
         RiUNs7YwacO8qLbH1EZm/vwaQfFmLqeUZmEyPKzhBDR7aFFfQ3wYImY/ch31CtAOcTyW
         h3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789450006; x=1790054806;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbzQq012R+ejKYv+RlREDKeINIqzcTFsS8nbpKDjfuY=;
        b=ffU6yt2sXtLvyjtRE9mVZzg9V3NHxmInkkK/GrZ/MfcTJROZ+nxCr1aUcD29b2C+sr
         GEl+reimztZPkARss6o/o4lUlOIZKZE5HlqSBs5PN1MpN3z5imFwiKMRyfkCQspIGcgp
         GoWBrufd+Gy8wUDYukZnUbsKoJusI2T6q6OxDn//H7mSO541gDAmSjS4okRJtRb/fGkh
         IOwisIQCGmwaKSllk5K3cs9ePTeiH5h5dAKoUKWCYj3vLH3PO63QLbGuK2nMeuFx90C/
         tCGhh2AdEqioEoV+FbTcraOHo9d8v4s2JITlXjMXg9DLwqIqmPIOpVBpla/q5ficuqP3
         OS4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzD3skuqs/4H3tg15UU0p6OwCfSg7LWCsu4TBHjGfhSZ9rQXVwbbjUmD3fEz1ZyS3QRqbjjU4ZsySI=@vger.kernel.org
X-Gm-Message-State: AFuF++nbrKxfkt/O5fD9YP92CGxTXsmICvl1wSNKcZUiL4I0hGWFb+LO
	iR4R3H29LyQtp539uJEneZQ6xi7FP08vuOvu5AN+KXOgdAYUU/OXDakr
X-Gm-Gg: AYBFou3uMt8YL/RrbC4xyYfOH+hdohrANo9Y+yIin61e5xw4+02nVScD/ey/AViDsop
	7ijV6a9R0nSUAh5ZEksEJ+h155XxsRgjZM/tbwNdI34KJq0wY3dzgBw5qlwfUhykO8hSspwVZoQ
	iyGHslpz+um4WLEj9DNsyNT0K1lcqMWDpSMGl5ceFOTh8e3kbWFKmuG8GYNIzt03PPiPk2ILa/a
	v5Zsuv1oBnZQ7C9qf9V/Q517pmd5SiRw9rgeVd9RGcIpp+r6od1UmSOaBq6ezZjFXsy35WcLtIs
	ARXQLmYwJkLSZjnPDOK3p0qlyjSppuADH8z0mLMgb25G0gV62hyEkqXyiMTigZ9FYtXRCQE2nnC
	VGqSnVASttakodoa0KKCEkWHl95JPYJ34YJV7kgNIhbkoCYVDG+JCuN9bHG7fZ29byNIDOAXNh1
	91HaGy5ksPX5mYJmzJfiJ2B0rYWiU6hx2E+IB7vdgy/wjmdPQfxufIHdYT4e/PqztWCEkwDtsen
	iMqjzO2l0fbF/DfuPIAP9hngWHN2AohHrJUtTE7smZ4bW7lYIp1Z64=
X-Received: by 2002:a05:6a00:420c:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-86f8314fd92mr12578546b3a.4.1789450005819;
        Mon, 14 Sep 2026 22:26:45 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b287c06d9sm5675699b3a.15.2026.09.14.22.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 22:26:45 -0700 (PDT)
Message-ID: <b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com>
Date: Tue, 15 Sep 2026 13:26:39 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, stable@vger.kernel.org
References: <20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com>
 <87o6e0nfe4.fsf@bootlin.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <87o6e0nfe4.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>> The MA35D1 clock provider registers its muxes with parent data
>> structures filling .fw_name. This is not the ideal approach since that
>> would require a massive amount of internal clock names declaration in
>> the DT. Since the DT does not play the game of exposing all these names,
>> none of the parent lookups performed when instantiating the muxes
>> succeed. As a result, these muxes get registered as root clocks, leading
>> to a sadly flat clock tree and no frequency assigned to most of the
>> peripheral clocks:
> Jacky, this is an actual fix which is a month old now, the SPI
> controller (and maybe other blocks as well) does not work without this
> patch. Would you mind giving this a bit of feedback?
>

Hi Miquel,

Thanks for working on this clock parent conversion and for testing the
MA35D1 hardware.

While reviewing the conversion against the existing clk_parent_data
tables and section 6.5 of the MA35D1 TRM, I noticed an existing issue in
the WDT/WWDT clock definitions.

The original driver contains valid parent names:

     "pclk3_div4096"
     "pclk4_div4096"

For example:

     static const struct clk_parent_data wdt1_sel_clks[] = {
             { .index = -1, },
             { .fw_name = "lxt", },
             { .fw_name = "pclk3_div4096", },
             { .fw_name = "lirc", },
     };

The TRM lists PCLK3/4096 and PCLK4/4096 as valid selectable parent
clocks for the WDT/WWDT blocks.

However, the new conversion changes these entries to -1:

     static const int wdt1_parent_idx[] = {
             -1, LXT, -1, LIRC
     };

This loses a valid hardware parent. I understand that the current
driver does not register corresponding clocks, so this is an existing
driver issue that became visible during this conversion.

Would it be possible to cover this in the series? One possible
implementation would be to add a preparatory patch that registers these
fixed-factor clocks before converting the WDT/WWDT parent tables:

     hws[PCLK3_DIV4096] =
             ma35d1_clk_fixed_factor(dev, "pclk3_div4096",
                                     "pclk3", 1, 4096);

     hws[PCLK4_DIV4096] =
             ma35d1_clk_fixed_factor(dev, "pclk4_div4096",
                                     "pclk4", 1, 4096);

The corresponding clock IDs should be appended to
include/dt-bindings/clock/nuvoton,ma35d1-clk.h without renumbering any
existing IDs, for example:

     #define PCLK3_DIV4096  236
     #define PCLK4_DIV4096  237
     #define CLK_MAX_IDX   238

The WDT/WWDT parent tables could then preserve the original mappings,
for example:

     static const int wdt1_parent_idx[] = {
             -1, LXT, PCLK3_DIV4096, LIRC
     };

This could be submitted as patch 1/2, with the parent conversion as
patch 2/2, although please use your judgement on the final patch
organisation.

The other parent_idx definitions and their ordering match the existing
clock parent tables.
I have also tested this version on an MA35D1 board, and the clock
parent conversion appears to work correctly for the peripherals I
tested.

Thanks again for working on this.

Best regards,
Jacky Huang

