Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E77175A80
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 10:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138984; cv=pass; b=aQdHwykcMNkwfT8MyodwyMELBzeCN14wMdfuKB6O83/y3Vx0fc7IhTBB7eTICJt0F7EESYbQZZ4mWYVw4+OrmS8YYDzCRKwMHZyOclAnZb7qo8HCHt2xmEZJzRg4jCvj4bzGHZCEPAXSuq5TH8mhMkXk5v/S7AaNI3BPj7msusk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138984; c=relaxed/simple;
	bh=BTIDpEfc1+b112+c2kI+TTQpJcYHlX+emjwBSzIoKaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rPTva4iwrjxE7HG3V2kx4AqkNlEFVn41BPbPsKEgx6anjuN45FYwFl9XTO79bORme2cYGlXG6KWrzzhwMufS3ItAeIHvVYiUaM43nsCtauOpfB8x/NM73ltJWVrbqyX4TvoEDd22makOtmrzAPuR1I08l9Z+Ope6Xsa+hCaUefc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W6wTZNuj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SQjltzHC; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W6wTZNuj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SQjltzHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773138982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N5BQkwEpg20oVwTBT/D3t0SfkhqTpfUbHJwJboz9pdc=;
	b=W6wTZNujlnfZSwHml7fGcLyIY/pQ/BVOjUE5eFn/f+swDikny2f13XC2E/JEOGd94nFIJ+
	R7ubOeS8483AzWUYLsN9865vmOwkzi6HI2Wbp/Q7d7H5z53AysIwO+hzvsA5HqfFkBdvro
	u0fGrxyhzTPgumhIBF/KY/Y96rLR55M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-D5sQvWR0OKmi7CRzbqGrKw-1; Tue, 10 Mar 2026 06:36:21 -0400
X-MC-Unique: D5sQvWR0OKmi7CRzbqGrKw-1
X-Mimecast-MFC-AGG-ID: D5sQvWR0OKmi7CRzbqGrKw_1773138980
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b90484c398cso1101108766b.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 03:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773138980; cv=none;
        d=google.com; s=arc-20240605;
        b=Iq//M+P5V3CTFR2YIOAMiZF6qbDvoynvm+z+pTZtKsrj3+4Uv2VW4mjdNEsC8bImRb
         JWYptUVBGe1YENQq06a2lBdctjEnbEatjJUrnw0l/0h0m9tkGjzHrurvs0E48M4m75UD
         LC/8CoClyjZPkqFoY9nABKZjJmPPGphnie3uyqXIqfjFkABjblV0QVYZDjT+1v9x74Wg
         6OW21tF0oNvmWGHe0QgBw4LacwwKglVHugQWDpN2ebHQLLofpsQ8DugpCnoNNJSMvVgz
         jreEG2Q3mnH9kPnBUlX6pZIOgiEuCK4q2KXp71fl2qPutkNm83urmS1SyOT1JjkwM+un
         7rbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5BQkwEpg20oVwTBT/D3t0SfkhqTpfUbHJwJboz9pdc=;
        fh=dlkMsrsjA4PcT+hzremCcncGs4sOtJHG3NG9ES9dpPw=;
        b=Zr9M/H2ai1qoAfvyhg5UQ47qT2nhUsf/9xVAMKYtyW/QFV7wvyJ8sqwJmRVLciNWWz
         xVi4nUCuagotS2ejU/lQf98gzSAUVETXat5qZmOS8rUJ7TnOhf9ItfJC7JgduLPVTYFL
         qLL9hiEmnn80FKhyMtP9RYUBoS8TS8pvH7/go4h18SG+4yzYrBpylKHsNupKdhzjmREG
         WdVs58G1c3PpBcOU1uWEq8B/4TqD+b36kpmo/qt8Vlj+k2UlWftn285ucfpBYSTrlv95
         rdHlGf45BH7rZ8SiJe2cBG0alIDJYKAWoGJLwgdJwRKgFXunQ1D2oY6JA12g/fIcIaHl
         m5Mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773138980; x=1773743780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5BQkwEpg20oVwTBT/D3t0SfkhqTpfUbHJwJboz9pdc=;
        b=SQjltzHC2fXiL7XnXOfRgVXacztjw6lw1dr9Jb35lDfbu/gd7uSm+nIMpLhWYvqS+B
         frSE1fVaUQAx0XQBlUK66yivcTIlY0Nic9N7R9VuDU5Saz5RJYV6P4fB1j53oHF+pVqT
         BX9CuxVthhqNc18QbKMrNj113a//Zmu1J/7dI4U0sTn6a/Zwe6sTdrAX2q3+gkyDOqE7
         2c5Y0hXoUkrCTIJuyR/jJcbPzUAdIrQHt1AG1KXpt4Btxishv62mqd7eYKp+xrwGkoBr
         0jT/mJfg+8lIaZoW6cQvDnjzCy82dFth9T7Xt4WG5qIYrBU5Kx3xcIVXZcSozcY8ehHi
         U9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773138980; x=1773743780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N5BQkwEpg20oVwTBT/D3t0SfkhqTpfUbHJwJboz9pdc=;
        b=h8RNHKIEF+R8tGC2gj3vmPoTY+Nbw87UxKofYR2sB7QAAPkmkJUKhzrj/xqQ1dTlqt
         hs/pnfcmBm4Ft9vQej3kCFm2T1QtKBeSAkIFRQT0lFStD7Nm2rWnzHSMw4wlY5G52Yqz
         fpvaZswk8WLG/T8vaPR79h9ycDs5U2blI4mdDW1L5/ToNEzW82RzL+nSgzNNHpEN8tDb
         KzqzQAfHUQyq/FNUM6/iEkX4K6g/RAqOT0uKgaJL9bP3fsUEU/RlBDBAMQ4cwwVceHsA
         ij27hWP3wwYTkHB3iIQIUcZXCcYxV+MXc1lyLI0X3a6H6sfTHmPq4Pku4oi4hUUV5Bv7
         pzcg==
X-Forwarded-Encrypted: i=1; AJvYcCXX2rLDwiENuKY2LsS/p+dJFCJ+V8zERx5nB4ljMnZbkk/UohyKUkl5Hyaq/LpxdDh3nRTI1SoiAPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsg9b+mxlscTbXK+WKVTaIpdjaGuaI9nfSGXmF8Q6obmLBPauo
	gmb0+yI88f2+M23NZyZ+SdMHjs/SXYAq3TTZ7wpGFOAl2uU/HYeaKbljJaiDqHwCnPMOXk6/5um
	/0Rc6kVP9WaGvMkzfo4icvCNB6EOdf58aNkZ6iFw1+JFRieZMmsKnK9KV1PhBk/zqdfkU9Yxprj
	DkwBHbHBRNET9tfGFRGj4FYNVe+9T9nY6PSrrN
X-Gm-Gg: ATEYQzwzij9baIiAnlmCYJp0lqFGUvlrPzsQ5AeKWDCz677L2+4qJ9MgrDWfHKrulqu
	prrgzog5l20/pQx7+QfqXbl6u12D50XIxm4FHEZw3R9fcT/dW7YmD5Pb0I2TolVVtm3R/SyBGpG
	44sLJZnajijuR/mH/LA9HjNeuz6XuF1IVCxtTAM1wqSGXPvy5RNFyPJVDCh6FvERxrB9GBhE6pD
	qNCEA==
X-Received: by 2002:a17:907:1c9d:b0:b93:6019:5858 with SMTP id a640c23a62f3a-b942dbced30mr845801766b.7.1773138979828;
        Tue, 10 Mar 2026 03:36:19 -0700 (PDT)
X-Received: by 2002:a17:907:1c9d:b0:b93:6019:5858 with SMTP id
 a640c23a62f3a-b942dbced30mr845800666b.7.1773138979394; Tue, 10 Mar 2026
 03:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
 <20260309-clk-det-rate-fw-managed-v2-10-c48ef5a3100a@redhat.com> <92127112-9d7e-4fc3-ac04-4ec0206d8bd0@oss.qualcomm.com>
In-Reply-To: <92127112-9d7e-4fc3-ac04-4ec0206d8bd0@oss.qualcomm.com>
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 10 Mar 2026 06:36:07 -0400
X-Gm-Features: AaiRm53nmRg1zW7rcERIS61hPt9DKGz3wtfNnQq-tIbfAAlJ6VqxS5q4W5umoOs
Message-ID: <CABx5tq+D4OeApjYv8VkcbMv6-Atc=Ob1e=7f+xqt0k0CUoJbbw@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] clk: qcom: smd-rpm: drop determine_rate op and
 use CLK_ROUNDING_NOOP flag
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 6:17=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 3/9/26 3:38 PM, Brian Masney wrote:
> > This clk driver has a noop determine_rate clk op. Drop this empty
> > function, and enable the CLK_ROUNDING_NOOP flag.
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> > To: Bjorn Andersson <andersson@kernel.org>
> > To: Michael Turquette <mturquette@baylibre.com>
> > To: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: linux-clk@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  drivers/clk/qcom/clk-smd-rpm.c | 15 ++-------------
> >  1 file changed, 2 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-=
rpm.c
> > index 103db984a40b950bd33fba668a292be46af6326e..8c6fc5adf5f50537a4f8d43=
872bf2f9065e5d6d4 100644
> > --- a/drivers/clk/qcom/clk-smd-rpm.c
> > +++ b/drivers/clk/qcom/clk-smd-rpm.c
> > @@ -35,6 +35,7 @@
> >                                       .name =3D "xo_board",            =
       \
> >                       },                                               =
     \
> >                       .num_parents =3D 1,                              =
       \
> > +                     .flags =3D CLK_ROUNDING_NOOP,                   \
> >               },                                                       =
     \
> >       };                                                               =
     \
> >       static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active =3D {   =
       \
> > @@ -52,7 +53,7 @@
> >                                       .name =3D "xo_board",            =
       \
> >                       },                                               =
     \
> >                       .num_parents =3D 1,                              =
       \
> > -                     .flags =3D (ao_flags),                           =
       \
> > +                     .flags =3D (CLK_ROUNDING_NOOP | (ao_flags)),     =
       \
> >               },                                                       =
     \
>
> The other two definitions (using clk_smd_rpm_branch_ops) also need this

Are you sure? clk_smd_rpm_branch_ops doesn't have a set_rate() op, and
it's been like this for years. If I add NOOP flag to this ops
structure, then clk_core_can_round() will return true with this
series, and it'll change the behavior of this driver.

Brian

Brian

