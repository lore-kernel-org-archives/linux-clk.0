Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793004245;
	b=HBhl3MW13/U67kv6H86+fKMqwer6XkYm0T3Up0D2FT1GOxOZIXRlERBnlKk/famlW7me
	 K6/4GFVDNxcrBsGOEbWNSyLdYhV0tLdZgrdEbMCPy6mrX8jTuikoeBPtwC5mBAoa7jgaL
	 LxL6O//IUeuL1lYb6JQpB89bKupFVVcH4aeLdju64x1mlUmr1ehsD5l19pDt1FY0SRJbp
	 ZxWTmVOUSY1NV7Vf2xYdwooNvG0RSZgE4BdpmqqdgzI6QNL09Hwv7WU6hs50jPx6NHscN
	 HrrqwdueOmNnsnLCghCGel5/iQ9NXu34QRE6k5Gx7dCy6OyrmiEn4fXdyOQWPICtcyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vuokd8eYBXkkOY3FeEgoxbWH+3rJnsQeEdkSp7QA0lo=;
	b=e+GZSN82tc63RdGXoq3GNkN6CJlY516Z2ZOg43jYL0vMXhoPe9EnM3h4P1BH/8eHrGYP
	 DjD+34rqDbe0U/8RxOxK1tK+EsTBTdthSGpUiofQ3i+XleLVg6q9FK1Z4jsle6wvnjsci
	 A23ezDlIB5cOtuNayitIBcZX6vugmGukJ+gCiIkiIW5KprMmhlPSwvYVDsW0yNA7yl5VI
	 GjrZMd37tsv6e4KLm1EOzAiASEeDPBmNFvY6Kb+7gWtPq2D0C2ueujQSSETIw8wg4ZLoi
	 On5Zxs/LyjNAtwKVKOUsixQ2O+ukCdePs0/zkQ3pQkKXEv7Wasw5wyJVt2C2k7K9wEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DdEl3zIQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B491606A31E
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 08:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B491606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DdEl3zIQ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35f036b17easo7457774eec.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 01:44:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793004244; cv=none;
        d=google.com; s=arc-20260327;
        b=B0CklpeHsvWpaHbmOAmjLzibHPxSSTvwVDcOnxFQ7KXWCo7fCXd1Hg2HkwUMAImMaQ
         ZlJU8ACOnut6x7muYmm+KHQYPnfEnV3YnQg9G+wc14vmyH/oImCtjgPEH/aA5irD21Fs
         CXEMl53vhIT09MpgqsuLXMP7vNYbahnHLWryTkducDOoVNiJIuEYQXrK5LwMD0hQOgrM
         yGQ5ioeLbK+QIE44bnUWwrxCd1DwdjZ22dzC09IlWU+3T1PojcSHZpk9nuRN1fJcJ0NH
         GV9mEUympZk5sUjyljIhY/C5EcL0yLnE2TqRNr91IUCX1JnrwZHtPz6CTu8rHfHw7Kk0
         cqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vuokd8eYBXkkOY3FeEgoxbWH+3rJnsQeEdkSp7QA0lo=;
        fh=17+5YFrG6VpW+iYADVhAbW/qkEHVySwf2mBliVQ//uM=;
        b=odVOgjUPZ/ES+x6fh5GiVIWIss8896iZS1OFhxe4fvP/ee/dMiVi9EhMz6LZBol0Ig
         jnHw92yAgiVW+bqPRKxXdE1crdYdeTFbynVrGTw3Gi6rggiYFPxhadRUYPBEVPKfmI4T
         2DU0VU0lL88kpHl+Kzfsr2mgMaGU3oMp7BuYwuCd7BRL+uEub6BfiIP9qfDtWFKGR9+E
         DvUd8cyfojZjw15l8+XRJOX0x2ABCdxZTlzVqGY0oCZuP1/w7rqKiATbfHFh3ok2d9hv
         X8D3QYQEZBtj11L75WIJIDaBvVwJy+UIwUXSeCsfP5ssGdmr1Pwo3rfavnlYYI34sdVw
         A5MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004244; x=1793609044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vuokd8eYBXkkOY3FeEgoxbWH+3rJnsQeEdkSp7QA0lo=;
        b=DdEl3zIQt0j6Wl24x/rH/CtH549T/6yz3arfh7UpUrcj6VkIpoMyYOJF0NDjpQo/t8
         KnIkRGw3mQKSuSLcmgmm1QRxFD7nafFegrsx97gfdpMPw9bSIdSMJkgN5ULAzH6PPtJR
         +1211R5Q3Zhp+ThE+b19e6KHxhmdDbYmR0W8ghuKMj2H4lP20As3vXQ213+vhFNpMZcs
         fzuE65p6rZWd3qQGy9q9CvG9GkFrGbtlh5Caj3W9g200O15HUM0hg1BMgN74DerPrTbJ
         oOhZzxb0gPAZQ9lk1EkvIZown3WXZ+qA2Xj8kSrVd1RwXvQviFh0pvX8/AIpiShu5UJ1
         rDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004244; x=1793609044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vuokd8eYBXkkOY3FeEgoxbWH+3rJnsQeEdkSp7QA0lo=;
        b=TVrQuRTV2VlXDRtZZzUFStE3PblBC95sJsad+hpuYOJsj35vNYLuxaPm6e/IdQUM2Q
         YHV0Yf4/9cG82eg0IeCTZwhAWl1V8ZqsIWMvGzm9jfHErA0fglsMwzNlhNoZw78T6DCs
         S6Jr7k/Ay5/wS4FJuF0p3N0HRJALLzd+HW8PtWMtOW+J2vzuxuOnylB5JmESVFVFmm5A
         pguAXYh+Tr+n90z0cbPwAw6W8PPRq9Q6wDj1upXTfKva/psufGDha06mQaQnpkV35CJW
         ZN7cJ1jRlweNYjlAkN0Rc3+l4t/6SyiY9egupF8BlJ7T/udomWA6mUzMOtaWC28s9Nfe
         7GIA==
X-Forwarded-Encrypted: i=1; AKwUvBxSOD9B2e/9ETR8FZDfRiXXeDgeHcuKBXw87y7shYIhvsTRgMsmEsAVB/ofQLhODm87pYO68Z3W6Uc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLferi85pbn4E0QcT8RX7ebWVFVNvtQjbIdH8swzygtNn608KY1
	WAO2cIn8ryi5wYUAn7eGWq+Aqq3eFaNJKq5KHocOJBO19RyIJt8Xpw1NiW2ufkO/EweoPaoulyd
	VN7hXCeRltDHEo6L9OTrN9YlF39Dw/Zg=
X-Gm-Gg: AYBFou35o2nc9pKCXFFOa1GDm8aQawEci7gBNuuLsuqP/vZ1iVOLZ1ErUwa9tUHXsXv
	wtqbQVIhLOxcbMgFRzxsJUhttaiDfyvXuMOLTVJ+Bjnxu1ZFjVd2XwkchMT428ZBLt9k92Mdk53
	1sLzMXZ4TkuZZuhDckqYIiRaLhODLRvfRlL65pe/aBCEKGAhayq0BUHfzmJtw/tvy4SPsDplEfa
	84DqmMkCaEnBoFvgy3dVkaHQmJnV2/1GFQel5DMyhFjqBR7WMLl5A4jKHHc4Z6Pw1KtyXKB40OM
	0kKW28ABZlAd3jDbVCPKOqkl9l4stKg6E9pr/INaKDcBGlHhPPlEYfQr6OeqaGEBEHddPTo6sN+
	esIEtooBMYRLxa2VHBfo8BkU3ANLItVf1MJv0fvgMKYylzRNuEgXiScO0N8ne6GvtVY7jnA==
X-Received: by 2002:a05:693c:250d:b0:366:8efb:bab9 with SMTP id
 5a478bee46e88-369e848362amr9301864eec.11.1793004244117; Mon, 26 Oct 2026
 01:44:04 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-dalmore-fixes-mipical-clk-v2-1-0a2d1118f930@nvidia.com>
 <510d6922-5aad-4b54-8085-9a769a1a934b@tsv-stahl-riesa.de>
In-Reply-To: <510d6922-5aad-4b54-8085-9a769a1a934b@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 26 Oct 2026 10:43:50 +0200
X-Gm-Features: AclHuK9FgW54R73JYrxQZ7QKLMuuRD6TDEnSd96dbrON3jVaOynr209LUb-EVxw
Message-ID: <CAPVz0n32UN5QtoHCCJtHtdcF29BYcP=2pPnhYo3yYy+2pBioDw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: tegra: Fix Tegra114 MIPI calibration clock parent
To: Patrick Fischer <admin@tsv-stahl-riesa.de>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 26 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:1=
6 Patrick Fischer <admin@tsv-stahl-riesa.de> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Oct 25, 2026 at 10:45:41AM +0900, Mikko Perttunen wrote:
> > Fixes: 07314fc108e1 ("clk: tegra: Special-case mipi-cal parent on
> Tegra114")
> > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>
> Sorry, I replied to v1 earlier by mistake. Carrying the tag over to v2,
> the code is unchanged:
>
> Tested-by: Patrick Fischer <admin@tsv-stahl-riesa.de> # Tegra Note 7 (P16=
40)
>
> Thanks,
> Patrick

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
