Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F161329371
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636934; cv=pass; b=ImvAtl7ERTy1Mom2vH6L7jevBsmuz/IQkL0HAX+XcCOto2MghU7c0bCNSYHGvaPOOq87jd6K9fMccroZ+r3fBx6Q3sM84j8LVa9YcJtVHNkMJx7/D7HY1LgwiKWRBcPJzj6XG+szwBWwTKruDFxzbGT8zENJnsOLXwjQLWqTJyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636934; c=relaxed/simple;
	bh=YhlXiU0XKCWPaqDUqf4rhyXjvfvZOfuj3Ya2JfRbtgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwpFj0ccRosz4D98XxPmThFWpKYOtzFsxSC3omnJ7anXtqo6z8yVd5m8kP3hQLd0alx1RMEP2tNpJCEmoXzhny2wHBLPuSj/CVASkgOkf3wlXxuUEG9swPq+wUW0ZLAP+TFLUnDcECfJAMCFwuDSfjHA+CoOinkGKFnytsF+1Jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3ffOugd; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3ffOugd"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so4689144241.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 07:08:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772636931; cv=none;
        d=google.com; s=arc-20240605;
        b=iwJRekDZtrVoKkZSIrsMcw9xSK4fLjQBVQ5chwaPPmkAAKs2B+f5JoWvlKFWKLYQR+
         HvHSkv9I85F5N5/OfjLkbRPPpJTl7iD7vIMtD2ioPZ43bk/TzBKJ+K1tXabEnPVcOTcL
         jWCceyElESn53foqTuOcYUVo5iS8Vod5zFQtZN8k+I0mfqHJaNvtj5M+vD/3hx20hTQ7
         5deOjIZbxGamE5GQ0b1elUsjeF5gQThLAg0XxBGmkbcOxjdvIsypWc/O0wnUULZxMwnl
         pP7HbmzTvyJaDuVFHQNM3oTI79unwRfrYfc+M35d8Ef0VBtjAtn1Bw2bSLp1weSbbXm/
         bCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zt95rYDrbJQ7v21KKoOXmX6dHYnzklnNjTFqH4raDgw=;
        fh=X6EtzCtrP7cyGci7aAywrw7mFfhy26XzLoob7owEAL0=;
        b=T/vCNNjcLSmhMq9PpzxbqJ0v12sZtp9T2Fp8hxT7g9Hts+yt67eVUiYoXxHD9xrmk3
         7ds/S9oAIjZ4Fl1LPvJ0UlN/FrrfchsW9MrNjhtVNXFsRxtHM1z5x26rdPakj535E5+8
         5oPEDoRSU0OS1Lwnc/Jvtsn2e5AV/uufA6StquX5Ef2Fq7afkmDrxC0kiP/lCMLeY1Ed
         f0QFe7JunE43425aAC2ZjnVvJaPkfSY4OCsWNW0O0wAE3bADr7JED36H63Q/2TlOb0Eo
         f5d5j5wZaoPpGHvMlJk9cnXFxHZDEo/pw0FU2KanRaofIIdOsiQ+dP4AArvizJraJNfY
         IzPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772636931; x=1773241731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zt95rYDrbJQ7v21KKoOXmX6dHYnzklnNjTFqH4raDgw=;
        b=K3ffOugdaLQFkS1vn+ekot/3RyzoeBOXHBSNNKzQ+DLP3A7Gk+2gByxVMkTBGGgbdU
         jSMvWlZr8rVQI0nsie9QXkovuJ+Tj08whQp4nXoiUiC37dGNFwIuCG3LbfUIZHgw3LaP
         df6kfbDFeRPeC8HwPVEjNE6YCRhBPVDkaKQljea4u3WUY0EHUvNT1gW2Gse4XSb+FC6g
         W7zAi1tuIoz2rQFxlzfSEzShi8q/06/ZhkoDTIaW+6V4/nYvExX8XXlpUDbsqQGcbqzx
         SHJ68mE4wu4ZcQsDRdpZiLMusGpbQ6K8XrU46wRMPHRBiKqe+NSE1+gxybeKqlwpeCrn
         51KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636931; x=1773241731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zt95rYDrbJQ7v21KKoOXmX6dHYnzklnNjTFqH4raDgw=;
        b=OQFvBiViVgkOLhwE9w/xgrBQzQcsA29FLJN6qIsIzIcQ0E+6KYHCvvsNOCH1atUvUX
         O6od9aOBzcFi/aLMtmSX6ueFfmmDbaWa21fq7JDLEqR7nwgIz1Qpw3NOsHE9zSvUFTvy
         2Qnf27FRGDkJyluWbpM1l17yKsbJpzNhmkPM3ol99/ORmJJ7/OKy79uQmoZgyGI7Gt71
         lXyoX1v0rqMJqzkcu1+b2yZ3EvG6QszCUauIh4ThLP9kcxIMw6X/BZyBecx0PaeoBKGV
         vVdJx4Uh8vB2h7nv64HJj0QCdbo6yGdjPE1i/JjxU/qtiuKBd3rc+y/jbic7GKxprH/i
         bnHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSko22llEM1HAPUP6mRIBiLAzS2nFin0FeEkPZIhvGIlcn+MVfmAXMqaDYLD+jGycyUgpBm5Q4S4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRvuXc4Oayso6MmUO20aPeM91MnylWFlRIclQBkMkZTX5v5hRz
	pEQN3OSH10WQE9S2KkECMXNRpoBTlVtATMlMWir+wbTXTQGK9QJqVDv3S8+GPcg0R6fn6B73E1M
	5lyfTfigVY9MAoofpq4XQcmGJ2cLAAammpAj6xZ4=
X-Gm-Gg: ATEYQzzTJcArvtoSQXbB8yYwNAQFR93UmJBzW8mBa0l4pm2+g5pbMmD+2TJbGxeGtuV
	S1+9KLR/ql2pL95P0GV0Aug8Zl9Du3PB2EA0b0Fuu2Ab8NqRd/KUbET+1/0ElUkZZdFG5jikXXw
	lOthKvYJKvFatMpDXSXQe2D3wGg+7onK8DI+8IfH+pE+i2ORYzM4FTUjf/dP5CJ46Zp6xGEDvR/
	MZWVHB8CP70KszGiQS4dcJ1vLMFNwKGM/LHc0NthGZcMIgyTUI+wj+fVkrvyfhm3B0Fzt/tnUMz
	bdEDOBI=
X-Received: by 2002:a05:6102:3ed5:b0:5ef:a416:be63 with SMTP id
 ada2fe7eead31-5ff8fc64c78mr3126757137.22.1772636931320; Wed, 04 Mar 2026
 07:08:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303115550.9279-1-mitltlatltl@gmail.com> <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com>
In-Reply-To: <aahGtIkxtNPeeWKc@redhat.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 4 Mar 2026 23:08:30 +0800
X-Gm-Features: AaiRm53efplzSDOab61tQud_P7APn9ZaH_aClYCYiHE6tyUSiXw8N58pgNHrRTk
Message-ID: <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
To: Brian Masney <bmasney@redhat.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	White Lewis <liu224806@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 10:50=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Pengyu and Konrad,
>
> On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
> > On 3/3/26 12:55 PM, Pengyu Luo wrote:
> > > From: White Lewis <liu224806@gmail.com>
> > >
> > > The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_c=
lk_src)
> > > had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate()=
 on
> > > byte_intf_clk, the rate-change propagates through the divider up to t=
he
> > > parent PLL (byte_clk_src), halving the byte clock rate.
> > >
> > > A simiar issue had been also encountered on SM8750.
> > > b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_=
PARENT on byte intf parent").
> > >
> > > Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clock=
s
> > > so that clk_set_rate() on the divider adjusts only the divider ratio,
> > > leaving the parent PLL untouched.
> > >
> > > Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock controlle=
r")
> > > Signed-off-by: White Lewis <liu224806@gmail.com>
> > > [pengyu: reword]
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > ---
> >
> > Looks like more platforms have this issue.. thanks for fixing this
>
> I hope within the next week to post a new draft of my patch series to
> keep certain clk rates intact when sibling and parent rate changes occur
> [1]. This will be for certain critical clks, such as the ones used for
> DRM and sound. I have it working with kunit, and just need to clean up
> some of my new clk helpers and commit messages before I post a v5.
>
> I'd like to test this on some real hardware and I have the Thinkpad x13s
> with the sc8280xp SoC. Can this issue be reproduced on this hardware? If
> so, can you provide me detailed instructions about how to trigger this
> scenario?
>

Quick answer, no, x13s uses a edp panel, not dsi. This issue is
related to dsi clks.

Best wishes,
Pengyu

> [1] Latest public posting v4 from September
>     https://lore.kernel.org/linux-clk/20250923-clk-tests-docs-v4-0-9205cb=
3d3cba@redhat.com/
>
> Thanks,
>
> Brian
>
