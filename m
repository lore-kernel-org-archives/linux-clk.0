Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F330C4F405F
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892838; cv=pass; b=al+BCLZfylSLq9aamW6sCV3gL78uOfsVue1kggsT3oYNN9Gepkb8OytrFF7Y0dNzxrYLcyKlOSUvun6moStXfLMkECEKEugJ1QdbppQLRn3jO2RGkGSnW3zTudN1H/RTyVWuGjHuEG+f0QggVfZRz7XPz03s+UislkX/Szfv518=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892838; c=relaxed/simple;
	bh=3MZ0rBUQQ/DT6hYuG6QZ4NQ/FBC1DV7mDn+OHinCE3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNTkibbg4WOSKg9O74weyEHWh896d5gt0By9ZkiEp9UPx2GH6GWVev5z8u9yKRnL15/qc6bJiSkGb4UrqI/HBawOKTiBnvCVIF1RwwVcgJ2eKZY+64MG4eEeKaOncxP3oH0cB2oPA6dApHCCJzlJWASqzcy7wydgGMskTkQXA34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=IaZLwu7R; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="IaZLwu7R"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6768403e9bbso2292539d50.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 05:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791892836; cv=none;
        d=google.com; s=arc-20260327;
        b=gtI/j+EMY80qkeSgpo4mGaqdjz7JKqDYSxYhTXCCT+eyXCCzWIDWyNdIW0jwizYjI2
         iizH0mcZChOtHE4r9/oWKyR/NS7fjMSNUhFLe2KDRHKnAkYTa3B0w5RujJj0fQpz2Jb+
         DjVQyPw/N8nApL+aMNwjJTAnUSFoz62Tw1ZOFuEAO0/E6hys9sbiYsA+YwVdF9NrsEYx
         TPObNRAbU386EBBdDIPnQd0y5hIEFH6YqWxfGVbXgEae0GBS3LffwhJ87FxZDjycrlTQ
         ofqB3qxswBxhDUdHdYSD0vSVsUR6xxIE30uqg5pz+2sxnLmN9H3gpCRguX3VBqWduUmm
         4JfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPCqI76VDLf6A6OD3FPwbH85jg0U2eYBPW7UJZyjAkU=;
        fh=sLXNvfJRhqILB4gs58mBiAm1HdxGB2b8odcUhEkJCek=;
        b=CAtYmTvXUC/PZBALL3FYNqP53kLTJAs6Hf46KI/MxGSXG/7dud2hudae8rw2jvMPG3
         tdNN0rKJ0N4pv7sGmeSpt5MwvWaqSGcR0p1Sb38y3kD+nRhtluM0QZSZtSV56l2XIJLP
         CeMOYn6lsDCKevnb8cWuOlSx9Y90ON9nvkFjlb1HFIZDsAR902aFyCC2xLsyPwT9BB+Q
         jV2wr4jg0rVmlRZV82Sh1u+cChrPChNJ5YdBJGp2ckoITw/Uvl6ImSWH9bRnO4JZL0mP
         N7e1/KIix6L0h5FKprECs2hxJZ7aBE+Hp8gNARSoqn+epALtqfIYKHtElML8eECeKxM7
         F4zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1791892836; x=1792497636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPCqI76VDLf6A6OD3FPwbH85jg0U2eYBPW7UJZyjAkU=;
        b=IaZLwu7R8ZTUVshbS8jWl4wLf/889Kp5dpZ8mC+Vjb8PzD/OJVDP4TPwDs/X7SxWj6
         QTuLu1+L4G4eV6GTQGNpcU1q3yf0mjQnDgFTrWN0FPp3JZVm1TBB4pZ4c+mB1xou3nL+
         C/Q2w30XPDuy7tpYbSQtkjvWG57ST04mbDhh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892836; x=1792497636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPCqI76VDLf6A6OD3FPwbH85jg0U2eYBPW7UJZyjAkU=;
        b=RnGL0kIFaMWKiqv9rQcz1o5ylppS0891Qn9PqeTCgvdKVHjPoMdwxk8vMNO/Zr+6fV
         DltjSdn2n5nhWioISP1mRC5XDy1DEBHS218l0wnmewAP27gQh3jtYEqziXXFkxQ/MAzT
         KnVm+WhhNDN5kR+x5Zfk859Pujv4/qBLmOm9PuTTsJp8RGX7QZVR05KqZKgYx700oZVS
         HRexCzoelc1oPZ6dAF2zrtZ9XgNaGdKppFNyhiQl4X2XxRRShLbDX0yxcA4k5MOqs9k8
         8fqkk9xkI8lw0anRSyWPecg4mW+Iq3+tl0V/j+403pBiiKdzAyjd4BVMaLYGD+Kjgqf2
         wYdg==
X-Forwarded-Encrypted: i=1; AKwUvBxSxTAWdj5iuRBveZsoCEvvSnXwqz8EatmFqOSdfx5w2ai5m/zAQieeBcY10ZW+PETS4YJUWDeOSuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt2sM8ULOc4PiTnGWQiHRr8zCj2WwhBECux/6rG3b/vEQ46V7Q
	EpEvP4eU6UqtjBETmkn4bY+4NKwJcOqsxsTUWQ5puByjJcG4WnuTNqZu4DcIggxxGAM6YvGt4XA
	8vRyNLt+yk7i87+YhuOqkEGTErdh+fobtF1innxsxUw==
X-Gm-Gg: AYBFou0BykJ0+xt6a3pxwThLy+PPFK4+431AoUAhjfWFHpGqhPd9/rkiI/XHPrWkj7k
	A9yZpw3p0MVxBPzh+eWCgc5KLrb/On0J9DBNddxyPzKkOw0CVXVE3YFQxMHP0MxGMuIP8To286V
	iyV4fufiVyBPtSuCigyFMBstbyrXMpfLihSfor0jJBIik1LDPN1dS3CrvueMkeLCArJdNqHLrX+
	Avz8FEuCp/0yNBoe+wPeVTI/dtuhXHEiaaNFYjHL9oUApaynHphLGQnDxFYeP6BjA1DfBYktCyL
	L/agTzUa9uUiX9uHCVvUOeHuG0D0SEz6lYkGaPyVbia04S49oC9FHBQgqwQlUq8ypSKbxTe+Vzs
	PgOfBAWMWKPRsm0xHiffTR76DF3AHW3zlqseER9cnAC2p
X-Received: by 2002:a05:690e:418b:b0:677:d67d:39e3 with SMTP id
 956f58d0204a3-67936767e9cmr4005406d50.2.1791892835727; Tue, 13 Oct 2026
 05:00:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <179070048452.199845.10870046832708018931.b4-ty@b4> <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
 <ar2q8M7Sn9DccVBI@redhat.com>
In-Reply-To: <ar2q8M7Sn9DccVBI@redhat.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 13 Oct 2026 14:00:24 +0200
X-Gm-Features: AclHuK8xxG5WHCzDqDFRzliodJK57Ya-SC3DZoZtYPsOSf_tESDvqgcH-jYqUEQ
Message-ID: <CABGWkvpjZsDR=tOEeNfEGY3TWC0U3o=ZZE4BEWCx8DF7uBmt+g@mail.gmail.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
To: Sudeep Holla <sudeep.holla@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Brian Masney <bmasney+clk@redhat.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Brian Masney <bmasney@redhat.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebin Francis <sebin.francis@ti.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sudeep, Abel,

On Thu, Oct 1, 2026 at 2:36=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> + Sudeep
>
> Hi Dario,
>
> On Wed, Sep 30, 2026 at 11:01:28AM +0200, Dario Binacchi wrote:
> > On Tue, Sep 29, 2026 at 6:48=E2=80=AFPM Brian Masney <bmasney@redhat.co=
m> wrote:
> > >
> > >
> > > On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> > > > Support spread spectrum clocking for i.MX8M PLLs
> > > >
> > > > The series adds support for spread spectrum clocking for i.MX8M{M,N=
,P}
> > > > PLLs (audio, video and DRAM). It has been tested for the video PLL =
on
> > > > boards using i.MX8MN and i.MX8MP.
> > > >
> > > > While at it, it validates the spread spectrum configuration in the =
clk
> > > > core before it reaches the providers, and fixes the i.MX SCMI OEM
> > > > extension, which converted the spread to the wrong unit.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [2/4] clk: validate spread spectrum configuration
> > >       commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88
> >
> > Thanks for picking up patch 2/4.
> >
> > I put the two fixes at the head of the series expecting them to go in t=
ogether.
> > Am I missing something for 1/4?
> >
> > And how should 3/4 and 4/4 be handled?
>
> I can pick up the other SCMI patches, however I am waiting for a
> Reviewed-by or an Acked-by from Sudeep for the SCMI changes in patches 1
> and 3. It looks like Sudeep wasn't CCed on the original series so I added
> him.
>
> Abel is the maintainer for imx in patch 4. I can take this as well,
> however I'd need an Acked by from Abel.

Just a gentle ping. Any chance to get your acks on 1/4 and 3/4
(Sudeep) and 4/4 (Abel)?

Thanks and regards,

Dario
>
> Brian
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
