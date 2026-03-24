Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12FF38CFFC
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 12:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357014; cv=pass; b=qpiao01Td32IW8qirfJMKWdIJ8DJYnHtST7rlhY9WlcidaSenrO9diSNusCRfHV8AdfDg2NUvodWgLy2GlhCpJO5yeiLrMoMhBhOVWrdQcDRKqaiboR9m2uVxOD9c1R0ilpGtu7EUFQI+/pNkeJNBQ2ZOsnMSZaPjARshzwy+io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357014; c=relaxed/simple;
	bh=06XpnV8zg64W5RaYQb8EET8nnTo7zdHdhj7IYD7Y5ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h/bB1/aEQuaujXH8nqwPql4EYyu1WmL8OHYemhW5ExOjFBw0YVIeQ1LUgp2UQpmJ/eJAaA/r1TarT9zfaCmIAt8Oz9DxBQgk3QLlM+i1rN5C1CcyUZu9AnDRp6tFZEYOka3atEXJNzBx9r490jvg0bPt9+Msa+lPKMSC5OG38ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aN3QvYqc; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aN3QvYqc"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ffa277c115so3435883137.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 05:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774357011; cv=none;
        d=google.com; s=arc-20240605;
        b=dayjKmrpp5uA1/Sz8Pn2xkA18jchKvaGzk94RCT6ZzNwRMeyeqP3D8TnJhZ0r6ZwQK
         oqszYNl69XPLvCKSQqX6sIEwqg8DVFdYVMcvetmfk81J1RhwMdzAmE9QaVIj116ydwXc
         pkbX9sBsspkeXmKqZB2W1XuLZq6r/ZsVLKb4/6VpLy2xEuzm4efxvyPFQGwgWog2Uqo8
         GMi+rpD2Mjeh+1cGP759C9s4IHXG82G2c+it1VhGLZkyv1t0HMIVubfX3aljmN6wNgPg
         tNNsfd6grIv9pU/7NWdkg6+MLANqBLaVnDBrj5jNOXcjDz1PLS4Pe49gDtEkLwSUokEA
         Pqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sI8vJKU9Q3yKpt6NPMFT7ralVTCYenpE05X4y0NVE8s=;
        fh=uk+elQwMtbYsi2HyQk8Im6bCHYJ7LPbqYrnJ2a4mORw=;
        b=BPilsYVGucN5ZIR7XO5WrjaNld6b5xpnei2gt0+oSURK9lREmipLg+v3I0hXIA7LJv
         w4fx+vvjLHtPtP9m9VW/uf/fazO7rd4BkNZIncJHXfVeZvJTcAhY4D8D5V+O4y4lJy/h
         iZTWuurXU1pxT73ptl18sBEVENwLzyPTzk6hxMfcqhx9YtuoysOVXfMJViBN2jZ7gl1M
         aE7tCzU8W+DgQZuYqrKd/q6m0CXrMtQeAWqaABzjnoi1ywvBYfLse4sgPqr3iyNiVJ4m
         H2owPZxG9vDiCUO9obWFnVcmCl7+AVaSA5aJEKzj0ZWBxcQ+G8Pb8S9GpQj90YzmBKlc
         MhGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774357011; x=1774961811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI8vJKU9Q3yKpt6NPMFT7ralVTCYenpE05X4y0NVE8s=;
        b=aN3QvYqcl6uyj5NEijX2PNex8aRZb2yezeS3slMZK4hMaanI6fFhJn7r0sjeCUAtfF
         cJuH/zhIRCbS1ihUb1rvjIWE+q4ObgD5XzDPTcKn5mHgtsD5wXZKiWX3izTA0wv4gHrz
         1RTWbymtNn4nK6V9viKxH7FSD+3Dt4xi8KsWuLtCK5Ar/fk9WHm8lhlak+XXgM5cduGn
         1aFX0Isx0UtedpQ57Xzmg/aBw+ccBg1pZCKE6hR48MMQD7RNNVBjZWRud0XdgO6Yce5N
         mlse64i8HmGBHInIsoJ+9yddmCVNdCdo+8c5f0cUE2aIc5+jpi+6Qwlepqbh7Az+aRSZ
         pw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357011; x=1774961811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sI8vJKU9Q3yKpt6NPMFT7ralVTCYenpE05X4y0NVE8s=;
        b=JSnisvDCef1QIkiUVzr2W6w3WWWYG+Wi/robrVL9GiKWW1jvIeJ5tgW4Fl0RTGaXV6
         EdECU6jDei56TR+yeAFUQnw1KijofMjWgHIJTeuncpYFHPztQ2jJIdUVg4ke11q32SiR
         78fCUNzSbIFcoFjHvBD3CvAmQ4+dwV1jhvhYQYiSm25CYPiBrnEo8UnrbmJFqwfYRRbv
         26AeiixdYEN6WFZb2m2Q+Gh6xIjoKPjrbylB1cV4O6oB5PcKC43dR/TpRwTe1G9ngXfN
         6v2HDt/AUlKaMoZCQZv3bgI3hxk/mfZugh+u01D4A9/hYhTj2kpzVP4F5HszjQt1ut2t
         JgZA==
X-Forwarded-Encrypted: i=1; AJvYcCUce9CvZK8wWb9KJccfCvvYX7E1gNhGovgoYhOUk3nzY0cKNVzK7I+yQqtsEg0GZIHV1vQfPza7DQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjYcjmiSbjdVbAQmFLHeOocrdQqxVJoogFtnNNldHREoR8L5Mi
	DHxws3QhPi01Vw78t7Da1ZrJEURq0DG4jZ0/D4oh4j2pj4dhP0a2UmSq4YN2ZdoPU/hI4qBmIcF
	QEMPKeyiu93zxxddve7JNbKRfnzIfTA3WDqR17Zo=
X-Gm-Gg: ATEYQzxGIreZdfN0DObLag4Mg4qkaqY6TOpybJcG7quSwjG/7HvR6qxaueAngDVH6Mv
	Z0AhL/OlCvoPWYwIYeR+fFqk/pERWPJWNVwlDku1a9Ft0JLBXqup4VbR2xA4hfT2+wfWyuYhmbl
	UY9QZ7LOROXoA1zQHrYVVWY/H+aZnPzxmiDqdCL/pF+Oomj+OnTztBP/qEkOmxByqLszvgHOqKL
	fqd2pFn5GlPgLUFeuiynRwfmGCYytDjFYjD65QFEXbX5nhheXao+lru2SnhBzKdnwauOfo86I0R
	vsSVL6M=
X-Received: by 2002:a05:6102:419e:b0:601:f74d:a671 with SMTP id
 ada2fe7eead31-602aed4261cmr8703142137.30.1774357010730; Tue, 24 Mar 2026
 05:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
 <dda88cb7-090b-4baf-91f7-e6724b506134@oss.qualcomm.com> <vonorgmssumelw3nkgd335lzi3eekinlslqb24k5lqwzil3tyh@epcgwiiu3xqu>
 <ca88ed26-51a8-42dd-9b1c-3266a107c180@oss.qualcomm.com>
In-Reply-To: <ca88ed26-51a8-42dd-9b1c-3266a107c180@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 24 Mar 2026 20:56:22 +0800
X-Gm-Features: AQROBzAXlHTH0sfKTDTSX1I53HFppyLBw_k9kVJKjc_1gSsUFMxL32yKmCv63JM
Message-ID: <CAH2e8h6PB43h08aZsHmN68Cp5HHuEEmhD3WhF7KOaQGyqvHjsw@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 5:22=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/23/26 8:23 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 23, 2026 at 01:54:29PM +0100, Konrad Dybcio wrote:
> >> On 3/21/26 10:50 AM, Pengyu Luo wrote:
> >>> Recently, when testing 10-bit dsi C-PHY panel, clks are different
> >>> from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
> >>> now (dsiclk_sel =3D 0)) And we failed to set dsiclk's children.
> >>>
> >>> dsi_link_clk_set_rate_6g: Set clk rates: pclk=3D172992000, byteclk=3D=
108120000
> >>>
> >>> byteclk was set first to 108120000, so the vco rate was set to
> >>> 108120000 * 7 * 1 * 1 =3D 756840000. When we was trying to set
> >>> 172992000 on mdss_pixel_clk_src later.
> >>>
> >>> Since there was no matched ratio, we failed to set it. And dsiclk
> >>> divider ratio was set to 15:1 (wrong cached register value 0xf and
> >>> didn't update), we finally got 50455997, apparently wrong.
> >>>
> >>>   dsi0vco_clk                1       1        0        756839941
> >>>      dsi0_pll_out_div_clk    1       1        0        756839941
> >>>         dsi0_pll_post_out_div_clk 0       0        0        216239983
> >>>         dsi0_pll_bit_clk     2       2        0        756839941
> >>>            dsi0_phy_pll_out_dsiclk 2       2        0        50455997
> >>>               disp_cc_mdss_pclk1_clk_src 1       1        0        50=
455997
> >>>            dsi0_pll_by_2_bit_clk 0       0        0        378419970
> >>>            dsi0_phy_pll_out_byteclk 2       2        0        1081199=
91
> >>>               disp_cc_mdss_byte1_clk_src 2       2        0        10=
8119991
> >>>
> >>> Downstream clk_summary shows the mdss_pixel_clk_src support the
> >>> ratio(35:16)
> >>>
> >>>  dsi0_phy_pll_out_dsiclk             2       2        0        378420=
000
> >>>      disp_cc_mdss_pclk1_clk_src       1       1        0        17299=
2000
> >>>  dsi0_phy_pll_out_byteclk            2       2        0        108120=
000
> >>>      disp_cc_mdss_byte1_clk_src       2       2        0        10812=
0000
> >>>
> >>> After checking downstream source, 15:4 also seems to be supported,
> >>> add them two.
> >>
> >> I don't see that, not even in the newest releases.. Is there even a re=
ason
> >> we have to list these divider pairs in the first place?
> >
> > https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/f7aec4359448d25c=
8a8d21ad8e8733d61f6b69ab
>
> Ahh branching..
>
> > We need those dividers to correctly program pclk RCG2 clocks.
>
> I would assume that's the case, but perhaps the real answer is "because w=
e
> don't want to try all possible combinations"
>

So you meant the pixel clk can support any ratio actually, and just
common ratio pairs are listed? That is interesting.

Best wishes,
Pengyu

> Konrad
