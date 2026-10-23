Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792748484;
	b=ydAldWZcxVWukZ5tR6ucPuOlAKSgF/oBcNWFUlrKoBwOUpnAK0o1EQCRAhtuK6p/Nx7K
	 0Muco5ah4Lk3BrJHpDCjyqI2s++kDUC24fICzOHlC+OK/8yMQOhdyL9Gi9oK+UCPWwGgB
	 NvjrT2QLWTixb/WLd2sCaNHu+rU7XVoYRuChDuT7YHJuZ9Bu2rvOCIHmxsK+SQgb9s84i
	 ZJOW01x19ExMFiVRI2DLq/CfXO4qqsmsPMDLVU+hT8H5XsvEHnYvyS3abYnGEIYSGagc5
	 d8q08G+m9mHiBgivbl4pxPR2QIXmwewuXje0pq4K8eOBfUxiWIu/KlJ7pJ/TNy5N7kQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Okgw5IuIeyoGQZ+JzmeJO9+dqCKtCII160B3B426Y1k=;
	b=jX0/E+GkV1fjAmpAJgJKUgRAJZ8FY+efJlB+D4OHBphIqGhCctlkfPf5fsVuF0SEPcyC
	 y/w1IakRIDKKggL4Ka10bNdhOcxIEqSXDcafvVUT8vnZMTiu56CJ/hoxbF3hWLkMGagN2
	 S3dUL/5PnAa4ZqXC8JdCQS5nIPfJdbkSMe5BVojfnwR2wGznN9eQ2mKExbI88QZOErRb7
	 Xvj35J69wKDtsxrxBegITYsxv8EtzG24ASGpKemN7R/4n1tIN/dFGCO6lKrnP9FbNQxIJ
	 fkBuyNMeU9E//EQvyF5mAuVG7m/jRc30WyrQiCYrhuGQF8hWWdp/lFbq/JFD/PSdvvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=NbnFC6ic;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA7606A31A
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 09:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66EA7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=NbnFC6ic
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so221762a12.1
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 02:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792748484; cv=none;
        d=google.com; s=arc-20260327;
        b=J3fC9m05+8mXmI1DZpYMJiGB3Y7OSL+C+7CwuAIlhoFD7Oz18itJO52eOwwI/Jo8XK
         ACT1D59G2qHNz89o04bW0Bahb8O+6O03vM0C4sufWRvvr8eCQhdrt2aNN62WQcR/vp6i
         ytHKM2ZU1vn11m3iWWXMtA3TByx9yo8txuFSxSdHShIUeZzHeOl/gYKZTk6kh9I0Pa6z
         Rpd4FN+nRhZDTd0dER13GjenKu5/H+1HHG9LjC0PuFBpajDrs1I6AVBKjLlllj+SXVbF
         pvLzfONioWaUs74k48LqAEGkmga+q1nRPbPWwJf1Wh6dDSC+M/klotL96jz2MFzMN8bz
         f58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Okgw5IuIeyoGQZ+JzmeJO9+dqCKtCII160B3B426Y1k=;
        fh=vDThYO3XF2oJ3aAPn0X9FeKm4p+4I3DMrNUbKmyWT/s=;
        b=ejTKjX67ct79ESg5UUvQXHyjRbHQf2Nk2+15vezLUlChIzY5XSoVoPnmNkEMcDv60d
         tdsMQbyxk9+YgIa/pY9iWBa3ZOjKWAKwJ+zvjJ/wtDOcganza8BkS/PFJP+J8Li+kbOf
         O/rhg2Cou2xYSmKnKnhV2Goeld/hT8NLs7WIDIvOyEejA8BjXLNEKac2Z39n7nTrdbnn
         YQfygioUAgoYnmhRE7/I/+1wdCdAc7+4t0RIWf+1B4zArS4HXEFV+Y7jD2Gir3MfGe+j
         +lCWXiy3kSNvEby+j4xeNrwyFn8UI0ZH8BIUTzt83bHc0u3YgHH3BNQPm7Oc+hm4PtI1
         s+Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792748484; x=1793353284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Okgw5IuIeyoGQZ+JzmeJO9+dqCKtCII160B3B426Y1k=;
        b=NbnFC6ic7YCzTwBcbpR7q/m6kM1BIsWqz6AVmGqI2UzTJ+lilYdayfl9Dyqyd8Jlj0
         LqKSdThWJ9k/Pfw78uVKyxE95Uu5wC3zbvaeyEzFc7D8m0MkQQZtVA/zy57hGDoqcUsd
         AuNJkeR+JiGxFYp+RWwkId8zDBR8pg16lKQEls9eA2U+PPWJLA0gTKAsCx/cP/bcYOqO
         pcltwsbn4oP5ffSMY4fEXa7KBDsVINYTbgAEqEfuUJLUO5gNu7xKSMgVi5RkiawqerjX
         yNSaca1p+va8vnMpfklHN7Hy3wTFru44ogGI5wpGLFj1j2e/tXOKbflXa1anevxV7Dkj
         FoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792748484; x=1793353284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Okgw5IuIeyoGQZ+JzmeJO9+dqCKtCII160B3B426Y1k=;
        b=Fww/wppOqCSEtYkgeG+H3p/keVITMbRSd1UdhQrk1wEsE0WNWBFmBxWYCMVy3vw6La
         Z9EZpbK+sVcC026alSw08fruPOU1O5D1Jv1bCYjHFYnwBwYT28g0AIQZWuzE8h8HojuZ
         k/44X1EjaugM3eNKczus6UGnUD7z9zj7n5oT4+++FKDwyoqWnnIs18f2kI8Vw7Bg/xBj
         Ra+d/2HvpykDbk3tmtHK2075nLckmguwFKCnkFrsezd6jndbAj+YfadXyhEZY5BL/k17
         VI6GbR1KvTVPdLW/f/giu8zj1VDAzmhK6JBdFfgMxtVo6vRU4lKSEM53i0vIB+ym8A7C
         6QXw==
X-Forwarded-Encrypted: i=1; AKwUvBygvzc3RtlZwusvrvvXrf1n8u0vGCXICCcPG6UU8sKzpBQhvE+vb+XCIpnBJNzJV9Cx+v5cmgG4DcY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJy45sopL2bCLt9Ery0+yMq+SQuG/4vIPr0331RL+6NaHyxHw39
	E8ZB9g54YAtVxNYtONWQClPfWo3ExRvCfhMs/trF4CVal9I7txbmzXIQph/v/AnWOF4+4F18Vqo
	MAECGRE0nW18rhPGsLolUiPSvrYYh4cipvtCnDYHvblCoNfla9sD0Swo=
X-Gm-Gg: AYBFou3cRp+5MLltBMd+R/d4tqFHklDapXOdK5xqwxtbSB1MLk6Dmm2ovHw0x0oqTAJ
	lq9OnH3WFYdBKVxdREB1OdczbZ3rAW9I/zVoNMJYcoEjg6xjwGltKkmQdcpJbUEJuNGzdB4tO8R
	X2pBbD42g5cu1JJZ6unG6+hoCv6PREEiLylEonkCe/TkdaPG2pD2pDbJkLpfcX6RIqZeOx33DSB
	kFDLD0Q2FeRVad0BGNeKRwylgMk8OOASh33mn6FhHMjKxMGL1c29rnHCfkBB2vXQhxXSpxDN+W8
	Ysr1+c6a6F2Uza5wI4iI9xftIwSJxUCcmjJuYWnSIbMSyB/R8v/7w5MnutmZUf9k88632FOP6eH
	A+495GqdnfBHyTgmiHma6rczAdNeqsxdDDIFErtnNH5trU3P/4A8tA1kqxH4prc2DFZ3WVyEO4E
	x6CmyxwHufAdesQ466
X-Received: by 2002:a17:90b:3805:b0:3a8:59d3:530f with SMTP id
 98e67ed59e1d1-3adce0df541mr1412012a91.57.1792748483778; Fri, 23 Oct 2026
 02:41:23 -0700 (PDT)
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
In-Reply-To: <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 23 Oct 2026 11:41:12 +0200
X-Gm-Features: AclHuK_z7zkTrXcOEBJ5YdNRtSSjaBF7iP_4-bXy54P0B5j7vSDrFZjtf2Rlh6M
Message-ID: <CA+HBbNELhPAAZoUuXm3SrvgxiU0eMaiu5LB3wfup04_HuZ+yxg@mail.gmail.com>
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

On Wed, Oct 21, 2026 at 10:06=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/20/26 1:39 PM, Robert Marko wrote:
> >
> > On 20/10/2026 08:54, Julius Bairaktaris wrote:
> >> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >>
> >> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
> >> which takes its AHB and SYS clocks from GCC, so the device tree does n=
ot
> >> pass them back to GCC. With only .fw_name these parents never resolve,
> >> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
> >> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.
> >>
> >> Add .name fallbacks so they resolve to the clocks the CMN PLL register=
s,
> >> as gcc-ipq8074 already does.
> >>
> >> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >> Assisted-by: Claude:claude-opus-5-5
> >> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> >> ---
> >
> > Hi,
> >
> > This issue does not exist upstream, as CMN PLL is not yet wired due to =
missing
> > networking, even then the solution is not to add global name matching.
> >
> > The required clock inputs should just be passed to GCC directly which I=
 have
> > just pushed to OpenWrt.
>
> Just read your reply after writing mine, I'm looking forward to seeing
> that patch!

Hi Konrad,
You mean the wiring for CMN PLL or?

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
