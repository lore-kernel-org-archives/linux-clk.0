Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792838122;
	b=2JBj+v8l5o8Jyx3h2qiS6gZ+D8z6efBpq48I4beehZKtaxO+c6kY20cUmw1ge98LRs7l
	 k9U4Qa39ai6yiE9iz2D1U6cUUcijDCxBwcEkmA6eIQT3shkCruAjuv3TGWXRwcUUPS26F
	 qL9OdVdpblGZVorIgt1YhTyXROcoWh44i5bJ+jN9Cgq8gqRazQ44kIOvMQtNKqJKOHD1B
	 Upgfm2wQxZRnUY9rynv1JZl/VWbD1QJCCuKAoCCQ+ViV/NQkNz2xtlYlN/P/Vp5LYRLid
	 NRNUobcAYPv3oTqlRdBUlrVvmutCU3u4dUwHa4JAKMZiMFgCBbzPuR7QJjfNY1wJojw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uGCDdPjdm8PF4Q8Mw+M6rMsR2imognmPTuJapISunSQ=;
	b=JkmGkMNNdXmjVhg09iI5L7YqgLc/uOmp8pxzUEkys+yBm4q3CjsDShvV7tiDSa7ooDvA
	 xNvqYOmGO/hAXvlLHhxHfyMfzOFX2+ZPnw+bqb7OIrNRBK2GQxd08OlDxiZaW9VolWlnX
	 SUWKmKEcsbXv+cSs5dTOIN9vTQmRbi8C9SrYrf+xUHeDOyq5Gv06NWI4KsWeMYN7RIJ3h
	 IrkBnqt27WCL8Xm0X/Td7JfKiwdkpY5scoDKxqWGHEY7lwbUDmvrf3mywD332BnLQsJpO
	 QXejFspjm8tycuDbUBzGVDP+B2xKfbm4KIKWKzmQDpyY554bZsfnus1i3rCQHw40uKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ljANwm9B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330A3606A31D
	for <linux-clk@vger.kernel.org>; Sat, 24 Oct 2026 10:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 330A3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ljANwm9B
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc758830601so1045815a12.2
        for <linux-clk@vger.kernel.org>; Sat, 24 Oct 2026 03:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792838121; cv=none;
        d=google.com; s=arc-20260327;
        b=WcBWHk56bIxKE6eOm3D6hGCgHfWMzPOE0ERDoQTHbV+TIHVMtOgOYSUmt+1X64CfEw
         RLOHiGUNUoaorBhL9XqhzhCPB+rZmiywUXrzjB/pCGqDWFH2KgnhM6p14C2yAn6/xXIn
         ktloZBCJyRIfLt0yCpnS7EdvcTlmTGp5lM10SEl+DunVgwnh8/py/VgFfSzgMIbRXPuO
         VkKKRF3Igt13uvqXv/tYlVY4+MIY2dD6vdOIUmiOnLXcGhSDS8/hqmMcGbCzzwKBGrYn
         IdQhQgiyGtm1IofVLNv4rNXjCLCG3OGVYCKxT3qLFCiLKvm8nsmE9ub+DiENCtS3RWO/
         U9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uGCDdPjdm8PF4Q8Mw+M6rMsR2imognmPTuJapISunSQ=;
        fh=tqFiD1Ss44lF65x8i/vlG98E6BUNnqnSq5rV8/jGnFU=;
        b=ep31s9pQKWI1XGzlAPtp1NnNeYDVR8aD+ajph1yNPVzt+vJ2PJTwzyoZjcjZSyfV1e
         pS/rp1GV95kNWwibapfPb7RYzPoeqUU6yOIrqn7LmQgqP7GaarybCzdM1qGJnHq+X+eK
         0Y0UXCQFW+909YREn62BOG5Q9X29Oh77DO/hXa3t1hNze+qlkjmy0wz1YnQLrO58IJax
         BvmVg6cigAOj74CHzBYyN0EaQ5V2GYNrhbf0hA5LJXLUlsaMFnGqcNAXFdChshzJnv08
         q7FSjWpsJ6HO84brBzaWWFVduRlS70RkdvjiX4M6fEUsTikAkbLl+YmYOccgtjuJG/w1
         lWnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792838121; x=1793442921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uGCDdPjdm8PF4Q8Mw+M6rMsR2imognmPTuJapISunSQ=;
        b=ljANwm9B6EoPJseb/Kq4puCiEF4EWyMyp3X4n2LWv14GXwcMXrQFunBzY7NF2E9Kvh
         xoYmLEaKc7xY3wniTybZ00WnXOXYEeViJU1q8hAjd23BuQeZ1PVEIRnsiXggdN7gi7av
         roBQeMjH6PF8lsFFd7DgRfYyWH/k0KxDXEyjnTVs73NNTKNpwYrRFsItYFA6/BY+i63g
         i6maHwiCRuuiGcsW0Hk9rhVlvGPADq42KmeiH+Dz2TPeB2OTJUFUEIyay3e4K6O4PMJ9
         G4uQ/e0A6ITIG7MP1X6F3PuHc2HnbAj7R3LDRS2JcLWacivlBpU3RzU55UsdPMMEgQe4
         s9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792838121; x=1793442921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGCDdPjdm8PF4Q8Mw+M6rMsR2imognmPTuJapISunSQ=;
        b=FJ2fokZe1IulcPx4SsmdiS5oGRiKuZD5W0n1xH8MSN4e/3UsYqYZGkucKpD+iUPYyi
         LgJDlRVmuyobdiImZa0xnHHGScemi/V7L+VenO0w9prZ4F3faxPCcx1vJzrIuhTsWpmY
         v147CbG9Lpt8UVqynxxm4w8fIICcCGDiYdWygqqDasJMD2ut+C/2pzvI9qWvty1J/bJ6
         DyJnBUi8AurRkysQpCWPqerb2Zq1/9n7ZGNjZnAKgpXByLDE2WS5IpYXfgwITgXCZQnW
         fvaG54wMo2eteZcu9Ptoh8raAl8cckzkMDbLHf2sajYJtGNMHB5n8O35sr3ReHaoXybz
         Js4A==
X-Forwarded-Encrypted: i=1; AKwUvBxw00aV00JXdWYoYvlyY6ATIJ1gg6QuTl63Dxtn4fJWNEBrWaVaEGAY9oJUk64wqvfzvAb1OkgEZEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH+1CqBEf20TjaxDX6xO4/DjKx+3jHtbhTU7Rh56kZKNUxYGYF
	5GRrNs81Iyy7kK1nUhxfA7ZSGtzOaytFtBv30HPQ3mCgtydYhPHPK4Af/PowJMSFd4gzGgJ/GKM
	FCi9ypsE79rmgY8Zh3vJd2mttmdCripun1ermOgrpqw==
X-Gm-Gg: AYBFou0qzXzsjE3mX1a86OIR4JKXZs0iNvakDaUJnbMG02SJjsnQu5SzfPyMHzAIvVl
	hplZQYVqlJLrglgMasyVMuDVWzBCMmO6Za2VOmWW9gdqUFmnIThhBhJ8U/sioYvolzP+fy+WZ8Q
	fudLKF7yCUR2CRO9GsQ2grEHBaeiV+ymgq0GPQlzz5UVh+jm0K0PNdrHGZrXbbULxogGj7QOyBS
	L+/xvC/AFl76X8BSpHBKpbnJDnD9aEOVGZBGQZTxcwx9SuyZZCxTnqw9/FGXlNSXu5PUVBdJZyQ
	CrDVJfG+99UgMqgC/ZlSf1RvIG3JedWdIzHeq/Y8WG00cT6sR2XB1b/PUcoMleTN/wQJJS0XwuH
	JfTE0BsTy0BaRO7BjoJEgvrN/tKK1+sI3SHV844MuvNvBQtZWMhDAjDtPgIZlza+YGxS/I4NC9B
	fk3E6t0Or1Kc3zfkZM
X-Received: by 2002:a17:90b:582d:b0:3ac:c024:b275 with SMTP id
 98e67ed59e1d1-3ade9b2ef33mr1458580a91.9.1792838121551; Sat, 24 Oct 2026
 03:35:21 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020065430.1251541-1-julius@bairaktaris.de>
 <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr> <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com>
 <CA+HBbNELhPAAZoUuXm3SrvgxiU0eMaiu5LB3wfup04_HuZ+yxg@mail.gmail.com> <729312d0-d48b-4c92-ac6c-98ffbb23d7c7@oss.qualcomm.com>
In-Reply-To: <729312d0-d48b-4c92-ac6c-98ffbb23d7c7@oss.qualcomm.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Sat, 24 Oct 2026 12:35:10 +0200
X-Gm-Features: AclHuK931L2oXiPPuKzWcoF3-rZklcyBCLSRbJVaUCSuCAcGKc-a8jrSumJzuR4
Message-ID: <CA+HBbNFiAF03WTz_N-_N8ZJantFdSBud0vZbiNw60_Oxju_=FQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Julius Bairaktaris <julius@bairaktaris.de>, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Vladyslav Andreichykov <vladdrako007@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 11:46=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/23/26 11:41 AM, Robert Marko wrote:
> > On Wed, Oct 21, 2026 at 10:06=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 10/20/26 1:39 PM, Robert Marko wrote:
> >>>
> >>> On 20/10/2026 08:54, Julius Bairaktaris wrote:
> >>>> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >>>>
> >>>> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
> >>>> which takes its AHB and SYS clocks from GCC, so the device tree does=
 not
> >>>> pass them back to GCC. With only .fw_name these parents never resolv=
e,
> >>>> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails wit=
h
> >>>> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 H=
z.
> >>>>
> >>>> Add .name fallbacks so they resolve to the clocks the CMN PLL regist=
ers,
> >>>> as gcc-ipq8074 already does.
> >>>>
> >>>> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >>>> Assisted-by: Claude:claude-opus-5-5
> >>>> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >>>> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> >>>> ---
> >>>
> >>> Hi,
> >>>
> >>> This issue does not exist upstream, as CMN PLL is not yet wired due t=
o missing
> >>> networking, even then the solution is not to add global name matching=
.
> >>>
> >>> The required clock inputs should just be passed to GCC directly which=
 I have
> >>> just pushed to OpenWrt.
> >>
> >> Just read your reply after writing mine, I'm looking forward to seeing
> >> that patch!
> >
> > Hi Konrad,
> > You mean the wiring for CMN PLL or?
>
> Yes the wiring

Thanks for reminding me, I have sent the IPQ8074 wiring.
IPQ6018 will follow.

Regards,
Robert

>
> Konrad



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
