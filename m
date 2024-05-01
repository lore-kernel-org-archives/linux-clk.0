Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26DA12FF80
	for <linux-clk@vger.kernel.org>; Wed,  1 May 2024 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714580320; cv=none; b=tpAsxRb1CpocgXucYSt/Mecl8Cy24BypWuNeb3Fmj8SdTImpY7WgrZw88VpRMTjLP6zB9C5q9XMSjwFvcLD23bo4rQHxmuz1UAguKGFJdNL67ucK4ltGXCsyhmXbIimDt9xmyTGBA1+RZ3pCiFlt3fvHR+kK74KK84ExE1/K2p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714580320; c=relaxed/simple;
	bh=RrsRAJmWysXYR4n1Z7QuovA3tEKIJY2HwJxpKg4/cqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9rQq3DcqQIFB2sicN4se55EnyQ2dYqkp9a5q5Ew335v20QhedDLq0TZfj9vctOPiHvUIfG+z7NqlujmSCA4CFm2KPgMCt3wFlkCTomVdgN4WFbFwqcJjcQr5o3affncW3ik60ufF7+lQGCJspsG9pcs3b6E8TYGiqXIm4EqIUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FVe1JJuu; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FVe1JJuu"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6a04bae512aso35384366d6.2
        for <linux-clk@vger.kernel.org>; Wed, 01 May 2024 09:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714580314; x=1715185114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrsRAJmWysXYR4n1Z7QuovA3tEKIJY2HwJxpKg4/cqM=;
        b=FVe1JJuuwmeJUs0Vbjx+S2qWt8uj0yXY/nTokp3DIy0kOqT2dgy+Kk4ID3SQ1A3jth
         Qoj6zSpLeFDLCiIWhZkf6Xkz2raTesIi6rpD6DuDQznHSKVnyq1+KJpFPP5Vp+x8FsVT
         UE8xk+zmprXSvGHkjCh3knKhZWits+3k3FlVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714580314; x=1715185114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrsRAJmWysXYR4n1Z7QuovA3tEKIJY2HwJxpKg4/cqM=;
        b=S5hFMXx4PkhUNZOwG0TK1qUoGqmi0liDYG3JTOKiKGQcEorqGqL09eyXld6gDRWfQQ
         aQRtc8qhWT1SXTxi3mTIQZ1Rzr1TybFikj2JagKghm29rqz23q9TB4ENJzGIvtP47pFi
         XcFI0CTLj/exDE8O2ri2voiUUpnuVCJ1NhgXPd2Bvp8sglMnimTFxpNtyx9rPdSNZULj
         XK868iL2LPtrYUsvuOu6d9oRe94sCaJaHmm3cxh3+FArFdzWidleL4Jr+G6oo7VlNdzm
         SoQT212pJPFO6akcWP8gN8bMtFmMsZB/hPYcym1B0R0D/MKlxUE90zCjUzjfJvKAsUJ6
         FC7A==
X-Forwarded-Encrypted: i=1; AJvYcCWWTFT48rKkvvoXcEydjBU34RzkaLKd7waiYT4g/VEkzDA3fncX6VThcQGxWZBJ6dWM8V1fFNsBtVOn7VQKWS/bG+0JODwrrVxR
X-Gm-Message-State: AOJu0Yx8InA74ATPWe01RNtHuI+Dr2GXycC5N10VooeM/dolDJ4UoIrA
	wzJ7B87Au7AMljJbk8UtpZqxqLyF59JEwBdjeNN7Tl5ODcxpUiRkPksuzauZcmJf3Hgw8+CQGjI
	=
X-Google-Smtp-Source: AGHT+IFOdMygGrQO37lmBHrk+r22CD5WcpUedmF/0F7YGuuuaMPRxVM03+EAcXt6cVYUF69/wpv0cA==
X-Received: by 2002:ad4:5fc7:0:b0:6a0:95a5:cf01 with SMTP id jq7-20020ad45fc7000000b006a095a5cf01mr3618121qvb.19.1714580314441;
        Wed, 01 May 2024 09:18:34 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id w9-20020a0cfc49000000b006a0eb265a6asm1099422qvp.65.2024.05.01.09.18.33
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 09:18:34 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-439b1c72676so82711cf.1
        for <linux-clk@vger.kernel.org>; Wed, 01 May 2024 09:18:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfwZLGmSwqfC3zwVNUu6+FGyRtfF41vx2AjzfLvfE/7wupjUn9CPr5z583i1TBXo9QiiPgAfvF9QfQC2eReIMPogb40pF1J1ut
X-Received: by 2002:ac8:5d8f:0:b0:43a:c84f:5689 with SMTP id
 d15-20020ac85d8f000000b0043ac84f5689mr236131qtx.1.1714580312414; Wed, 01 May
 2024 09:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327202740.3075378-1-swboyd@chromium.org> <CAD=FV=VLwa0AFsrXXxKGG+hcyW+h7u7-tyg3uoDB8M_XdPti_Q@mail.gmail.com>
 <CAE-0n51osUcpqqh6o9OhURLbRKjcWbRZT-5oHLi_mwfJsUngEw@mail.gmail.com>
In-Reply-To: <CAE-0n51osUcpqqh6o9OhURLbRKjcWbRZT-5oHLi_mwfJsUngEw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 1 May 2024 09:18:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=USC_WO_cqYbuHBoScbV=TLtxKSfXmtOBruLSpzSTy4mg@mail.gmail.com>
Message-ID: <CAD=FV=USC_WO_cqYbuHBoScbV=TLtxKSfXmtOBruLSpzSTy4mg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix a black screen on sc7180 Trogdor devices
To: Stephen Boyd <swboyd@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Laura Nao <laura.nao@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 30, 2024 at 5:17=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Quoting Doug Anderson (2024-03-28 09:39:54)
> >
> > I spent a bunch of time discussing this offline with Stephen and I'll
> > try to summarize. Hopefully this isn't too much nonsense...
> >
> > 1. We'll likely land the patches downstream in ChromeOS for now while
> > we're figuring things out since we're seeing actual breakages. Whether
> > to land upstream is a question. The first patch is a bit of a hack but
> > unlikely to cause any real problems. The second patch seems correct
> > but it also feels like it's going to cause stuck clocks for a pile of
> > other SoCs because we're not adding hacks similar to the sc7180 hack
> > for all the other SoCs. I guess we could hope we get lucky or play
> > whack-a-mole? ...or we try to find a more generic solution... Dunno
> > what others think.
>
> I think we should hope to get lucky or play whack-a-mole and merge
> something like this series. If we have to we can similarly turn off RCGs
> or branches during driver probe that are using shared parents like we
> have on sc7180.

This is OK w/ me, but of course I'm super biased since the only
Qualcomm platform I'm involved in is sc7180 Chromebooks and that's
handled by your series. If it helps, I suppose you could add:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

IMO it would be good to get Bjorn or Dmitry to buy in and maybe post a
PSA and/or request for testing to a few IRC channels where folks hang
out (#linux-msm, #freedreno and #aarch64-laptops, maybe?)


-Doug
