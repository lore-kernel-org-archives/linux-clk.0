Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795798662;
	b=YTCIJzKOzZ1DIZEaj6Vzpr694MsSsdhgzWAHXWO9XfYOWfjreQ3/QnPB7DanQ78broGs
	 1x77g3RI7nDh2jETfUokylbeEumAITNL1qzfiIlBVaRi0aTiQIpFtZXuwdFvjx+a+oUxS
	 u8MLz25K3ZeVio+A9wB/Yc0jN2R3PcWXprbQdCQ+CBfBxT88+s41/nMwDpORos4ckKhxy
	 gEsmJnKMEUJlbBLcqZepApHCouJx2O8mMXAAqgappgLQwCivV+/WCWDs84yqKdOjBz/kr
	 YG3D+bRnUvCEb22nc9Zqx4AZuB3ffPUTceisLnnNFLBy1769vRVF8tsSxBIpuniU8Dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
	b=JVXTLxwrhLB3kkQuEA6G2LkZgo5Q1sVQrpgsh6Etz/WvtIMLHLxBnkhsc8fBjpVs0YcB
	 MCwx8dEr3YjI579rUP9VJrMNOq8lNtYehwAKnqgmljc/72EAVr7GPfXiW1sfrWivPRNg9
	 LfXxq7vgi+RltroVaAf+YOy8JzDQEUzbVdMeGoJHqAT9adFV6w3eMtVvb9tFXY0puCQCL
	 YPndbeRzE6wzF1J6xjR6L+lbcjf7zmwJUE+hrNi7mKf4clwv6ofvCaDanX2VdIwhEyJJN
	 8MLAaBMutW4PfkoIMypQ+o7PObA2e/ZypbJ22LEaDLGy6oWl+Z4Ub0019MTxnsAYp+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f+CjY/BX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326B2606A31F
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 16:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 326B2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+CjY/BX
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55dc111ae86so17178681cf.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 08:57:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795798661; cv=none;
        d=google.com; s=arc-20260327;
        b=JabF1FrDTyMWdj0slwfJXWrm7hRKB00ycWNEj2sEBbRkSjw9Dn0K3Snmi8e0cloXMs
         +1VeFz6Ksbnl21dpnRjBwn/fzq6ZkiNbhVUsswxTvgcceFalE8sMofFJlw3RecO38w9N
         HbH7g9ATgWEa7xd9oaAMEWnEzo6SuQllKqht5mGWN8x5OloiYvLMM1F7DZe41jMTQeSb
         +HKXuS2V5rU436sFIw8gFLk9X56t5l8y2K2vhaHorTnpLAA8wxo/lwnWx01BEd1ZRxaX
         drBHN19Ib/JjPNXRPxSdQ0BSybVm0u94nFmgGTaK7+4MXBKwR3Vte1PWR1/3A2TptvjQ
         jxSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        fh=ogmZUWymun2Hc5T7PjwC0SkgmV9MWpFc9AM3gI4CP0w=;
        b=Z8t9LLqdF7S3rVXXXA34c8eDWduFzbq17Tn+5O64CZJjba0Oapl+BARoVEd492f1sW
         oWbJnY+U/AlhHcL0mbGziCvoOxYAUWAGI9BLN1yfXIxmJ40lXwxKiri4YHpqAtg8yp0m
         iLknTLOaY6rbylwras5PqxTrMmFHYMwokf9mSzUMgUh9PKcnZ5hsRIYQd5U0VIHI8qy4
         cwKcerPJ8J8qKz6kebc+monrLiPL2CLyazDceiwk9BwUDl79jXHYv1Hz6hfZtXeo/uCB
         os4sg/q+GG+Z+TDin8pYRl+W0mFTMpLdszTMmd4xm3lt1pJZgFPGsgejDdSWxBhhKidi
         9vEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798661; x=1796403461; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        b=f+CjY/BXcpKl6jzX9OALdg1mfYorM8PIZRIjW5rU5+YXEtkDEecpk4tbM35O+h2l+Y
         3BySmVV+mW3zLErChy3JX8Fn4SNdfz8iDIA4tmhi5DY7Ki6vPLJIZlQNQrgRm+e7BiZd
         Dr45nSTD78QTB0+Gfx0Yfaf4hrdQNxxnzTAPR2jV1bMjf5ntnpwz9kaD04KIpjR0LYoy
         t5Ky+I4vi9mo4WJ8lucIof1Cx3aBixtmy2uew8gN82rbCeH7WFL4MYtu1i6S9NN1z6hf
         dQrP6ZJu+O/wvnlHDys73uhLW4+ve2adu9/IiRkeEDmKKWgUl7/St2Op+kUmSiTtTpf9
         B5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798661; x=1796403461;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JoYlWYsc7qA+Bk9zv3r6KL/XVztnYAaVtmzSY0LmZ30=;
        b=M+qklIC3Cz1gB/lnddfDdQtBwFmUu8MFKup6wf5fpdWCXcJ7Je+H69B9BDSwhyW7N7
         cZWW2boYegXOn9+3feS27vWXFRo03IymKXxZHYgg9VF2viZtMxJ9jZ+nq8wkG6HT5y8X
         C2XrD4X1Qij3pK9iezsLhN6FZkZC4L7gzRUzAzBGmUfJhbZ0wfJxnlyC4Cvr9D2aC5Xz
         A9u+KmmG+a1QPIX+y1DZlKXUCsW5K2TRJa23RPKUupDjEI4YCjaO6u6ZLfukRH3cwm/N
         l06gjuEG5I0/D5BHMTGoZKIcFvHa1nqpdwOccN9P14RK2s8IC/NUeYQzEVH9oyrJRK48
         B2Kw==
X-Forwarded-Encrypted: i=1; AL+hErFs+ComSVr0xMExkANn14bSl2dBUP2zWEmyN57QGzIp8SbJmNwFxSibvYpG5AfbWI5nVW3OaJ/RijQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z95qWH+hLBfdGj2r/HQWQb/LcdTc7aZmmsbCbFgF4Ko6MgeyYwJ
	CRMsAtVuRSDnt1LAmwJTf6u1fDYxZ8/tttCXNsblLzdyY4axLntlIriTygRl+P9u1zWybAwvBmM
	FONbunZF24dGEvPyBrH0Xjqc2+58Hag8=
X-Gm-Gg: AZFdTZcWB6UqvGyhU/rAmErA4a6DrLA81W2UwVnFStswhdl/sunMSHdytXtV1fED0ho
	6D4z+PnnT7AMy5PsslxfgBqU8ZI3ZwQhQWLV3Xjn84IVChRD+KtqwHtFvaZcorUg5XQWs1eNn/M
	Si/GnaCEIvyTD5vXrjfxHEMsylYvibfcfOSwtRw15NFaPPr5d15VAFpX/0zZa2su9PWDWTLb1KF
	Bkf2iFpdn7TLmkOXc1pKog+3tlbOghrLNkNxz2K/VDJWx8IyR9hWJ/b3QI7kzAL3XWyLzLjOCNp
	dhju2tLvZ9BwFlTY+viMlRNQSz5U4BRN8rgJq88b//ClwSJ8Oirfk4RfwUD+YDNp20ALtS0H3lU
	blmUyc0B4WR8GNJqTaIuMnS6E28r06Y2S2acQiY7Cyi4A11AbzIIwjoSFk3/sK/mCdZo=
X-Received: by 2002:a05:622a:5a1b:b0:535:384d:68ac with SMTP id
 d75a77b69052e-55d769e9f2bmr449322421cf.13.1795798661145; Fri, 27 Nov 2026
 08:57:41 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
 <LKFsWplUk1yOr4M1dEHqZ20-Oo7ya-QA5qkF8u2lcfPUsbJYq0AoJhyjIEBwg6PPzlPSMYfqn6CB-sQBOuQDKQ==@protonmail.internalid>
 <20261127134507.125513-2-hikmahgumelar@gmail.com> <a8ee91a3-fc4c-4268-97c1-b4ddeff2558f@kernel.org>
In-Reply-To: <a8ee91a3-fc4c-4268-97c1-b4ddeff2558f@kernel.org>
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
Date: Fri, 27 Nov 2026 23:57:29 +0700
X-Gm-Features: Aa3M54oyapQeOF2CNR5heqj_kowOsQNp9ESIWcAwgObVTh4Yt2mT_qD_BbMY_SI
Message-ID: <CADA=zOPBRrzdST4rwNwejXF9cY8XJUFMXc=+FR5AQMiFFdKPBA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src
 100MHz parent
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan,

Thanks for the review and the clear feedback on the commit message.

I will keep "leaving gcc_camss_csi0phytimer_clk stuck off" and drop the
board-specific reference at the end. For the rationale, I will note that
comparing drivers/clk/qcom/gcc-msm8953.c with similar Qualcomm GCC
drivers such as drivers/clk/qcom/gcc-msm8939.c, along with testing on
MSM8953 hardware (my Xiaomi Mi A1), shows that switching the 100 MHz
parent to P_GPLL0 with a divider of 8 resolves the issue.

Best regards,
Hikmah Gumelar

Pada Jum, 27 Nov 2026 pukul 23.11 Bryan O'Donoghue <bod@kernel.org> menulis:
>
> On 27/11/2026 13:45, Hikmah Gumelar wrote:
> > The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2
> >
> > with a divider of 4, leaving gcc_camss_csi0phytimer_clk stuck off on
>
> "stuck at on" or "stuck at off"
>
> > MSM8953 platforms such as Xiaomi Mi A1 (tissot).
>
> ah I see.
>
> "leaving gcc_camss_csi0phytimer_clk stuck off" you can drop the fragment
>
> "MSM8953 platforms such as Xiaomi Mi A1 (tissot)."
>
> > Switch the 100 MHz parent to P_GPLL0 with a divider of 8.
>
> What is the data-source you used for this change ? You should describe
> how you know this to be a correct change - the code is simple and
> describes its own change.
>
> For example citing drivers/clk/qcom/gcc-msm8953.c and
> drivers/clk/qcom/gcc-msm8939.c since they are very similar controllers
> and the 8939 does it the way you describe below. Also "it works" is
> another good reason. Inferred from your patch but not stated.
>
> More accuracy is required here.
>
> >
> > Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
> > Signed-off-by: Hikmah Gumelar<hikmahgumelar@gmail.com>
> > ---
> >   drivers/clk/qcom/gcc-msm8953.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
> > index 8fe1d3e42144..8aec5600e837 100644
> > --- a/drivers/clk/qcom/gcc-msm8953.c
> > +++ b/drivers/clk/qcom/gcc-msm8953.c
> > @@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
> >   };
> >
> >   static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
> > -     F(100000000, P_GPLL0_DIV2, 4, 0, 0),
> > +     F(100000000, P_GPLL0, 8, 0, 0),
> >       F(200000000, P_GPLL0, 4, 0, 0),
>
>


-- 
Best regards,
Hikmah Gumelar
