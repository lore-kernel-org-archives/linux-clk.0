Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6753E4DAFB5
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 19:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832585; cv=none; b=Jga6A/SseyU2WxPIszSpgCRtq8RymeZQ/al3chqoQZk5IKGeQ8X3FekAkHWtFAcGdKUInLN+ruLa1972h4+JWmc3jGxl1fcY4LrmXCTwWUOkNrx0IzGlyxpA6GA0LSm8TW78/9WfIzJUyPqiEtshzkRJPLHYrzM5dzqz1IEta2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832585; c=relaxed/simple;
	bh=F1N9sc0phttKEroqTY7fq4cUBOZftvRnSXLYqSUrN14=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=PObcs8c2SnaqVHLp+FKL/Pfeo2uG0pO5/t/V8IH56Gm12fmpR0vwibinqIEtKY+9sb4pWzCq4BX2aJTJFCsz9ZdvLmF+3GF0Mego84yDm74QwrHfFPLwF+9/62EjxKEl9mF5MqghMVS5Eu7UCF1T22DTp9qlOFjnx9fB9b5GCfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=burcliSJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="burcliSJ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so17767645e9.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 12:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791832581; x=1792437381; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CRfRncq4FuUqEgsh+Q7MKNhu4iIEz6/gs4z1N6qwQUY=;
        b=burcliSJwJy8wntjxL4duhuZcZ/y8xNQMOrS2+ed8KpsCZk0oCS5hVSf5VT9fWL6Ci
         dctnORJH/vEmrkyvaNC3JF+H6Q2Zma+iT1N7AwwuNqIBZeU9eLOS0HONZod6fxaH3WO2
         WRddL6QzfsVQXpzf3eggBoXY3SDMrkQc4Y/dqXJoK7SWNu1MT2s2kqzEH7n40kBo14Pu
         +aydu3/+zEFmbeYZXFimx3uYfWeDLCz0kt1me3eR94tW+ufDdSZlsrnKfWp1kUNMj/hy
         cShyHZjkLEwCF00gFwjtZdcxL0OWrpZstHGRHtatB4exdL4oi+1bWxcUJAC6BY0x2GBt
         GvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832581; x=1792437381;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRfRncq4FuUqEgsh+Q7MKNhu4iIEz6/gs4z1N6qwQUY=;
        b=TjzebudhaNdpdxVqraGyN1d+WO1IopXTxn7wscLC1ncSUbOFIX05pTuRgqP7gQhziS
         s3UEpSZAbZ0ym0qTzmqZ5+jN8qSVTFNcimWtOtl46hXwrJ49dAKH6/Ukl0wmuiqVXYCQ
         edmLKpiQZ017KKrITM03YcEyKW7KM02w1WFlnCo4Psak2k6DK1PWbJP4NanKPop7sBwk
         TrDbixHJO2mRkSv+wES9wthMDoxekzBebevYjYoZcvSTEP0FLbcjKvvWLvElGg9wPdbl
         XtYua/u9KGE/8LEelbe2WT/ASIKSkCacNB2k6yK7QVYLz/+Xfx90MFYTIeBB+GuKV5i3
         v/ug==
X-Forwarded-Encrypted: i=1; AKwUvBzlyi+WiCr7ExofpjbcR9+E0WjIo86dQXpEYPHYKyiVodPbjmCR2IvXhxVnH0TkTfIHLcReK27JJL0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+tgNDyqNkpG5Q8rh0BkSIeOOLLFPbd//eaOqRaqLrHxrU6QnE
	UrX9NsFjKM9qopo63XdrKy+FBBpF6gYeECS3rru1Wgbbqwi2dubH9pjrijDZIEzYMo0=
X-Gm-Gg: AYBFou0BAvCBd3ZPQ5hCEyMCtPvsiMc2t71GR6GfLXC/0ItmhiEXFdfRAp46ZChhQDi
	Gtr3I7FtmewaS4J0vbcDAw4siFztKfCD9qfMseReuflR421zfandzHbUZjDiKmf617sQUuLDain
	GY4ZCbICgfoje/93GS/OStyYiIAhUqyFjTPb5zQTws7kcM1I381iPv1KjUl8zQAfb8P0DNB0pc0
	XlllZbWrY8rJkmd7+YCTMb9xlUFZ4skwVzfXVCK1r9xur0Ott5dTTqnaOOH3C0obRHmUqmlWs0u
	cYnDRmj9GvUkCjRJPyJgiRKOLpb71x2ZbQf0BBSwyi/ORHTbJj6p1DKX8zNRad8diib40ln2BeP
	mlYrJCJzPpoHoqzuh0dfApE6Ebszzk0eYVwHp/0q5Xs41xhd8ntSeuiS3NE9aRFJpJE2I1fDLfc
	Ifk9VCae39HPHlpeLdlyxBY750JBylLBd1ms7BYSGyNJUnXgrKQC8oGUvORkXUj572z/36xNi4a
	nyEAMQmEzIW8ijHi8LORCZpo4YX
X-Received: by 2002:a05:600c:8b70:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a18e4a174amr194169405e9.7.1791832580955;
        Mon, 12 Oct 2026 12:16:20 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm478285355e9.8.2026.10.12.12.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 00/15] Add basic clocks and resets for JHB100 SoC
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261012-grass-guru-1ba876eda895@spud>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <179180050741.66744.3459927533880490879.b4-review@b4>
 <20261012-grass-guru-1ba876eda895@spud>
Date: Mon, 12 Oct 2026 21:16:19 +0200
Message-Id: <179183257960.266355.15581316876923702717.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=F1N9sc0phttKEroqTY7fq4cUBOZftvRnSXLYqSUrN14=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlnjZhzV537/L/M+KX8bkkb84JgjbmKcnd7zSVXvGQ/5
 +/C/0awo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABPx2sbIcMUr0nD6Uoazbr/u
 /xA7XB+v681zct+D7QsW+fbozLtpuZPhnxWT2QFppxW/hcrua0zme85ue+FEzqEHjZ7nmtNjjC9
 E8wMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-12 20:03 +0100, Conor Dooley wrote:
> On Mon, Oct 12, 2026 at 12:21:47PM +0200, Jerome Brunet wrote:
> > > The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> > > subsystems:
> > 
> > Nothing really forces you to send them all together.
> > 
> > In the future, could you try to send one CRG driver at a time ?
> > 
> > It is fine to send big RFC to give context but after that, if you
> > can make you series smaller, it is generally a good idea to do so.
> > 
> > This helps us iterate on the series faster and then you can fold our
> > feedback in following series (instead of repeating the same comments
> > on multiple instances of the same thing) Thanks.
> > 
> 
> > Also your series does not apply on clk-next or -rc1 and no pre-requisite
> > are mentioned in this cover letter. Consider using b4 to point out
> > your pre-requisite if any
> 
> The dep should be the PR I sent to Brian, but I suspect what's happened
> here is that the MAINTAINERS parts of those patches (which I had dropped
> because they were all conflicting with my tree) didn't get reabsorbed
> into this series. Very annoying for review of course, even if it's a
> non-functional conflict. Of course rebase on top of clk-next would've
> highlighted that to the submitter!

Yes it was only the MAINTAINERS file which I did rebase to check if the rest
applied correctly.

-- 
Jerome

