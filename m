Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A0342047A
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421286; cv=none; b=RGVBtK95skv01ox0Q70GDaM4IYhuPKuYKksrGUmXsP/lmf+tVrIcdin5gbR1oda/gOJZbdQ6QOepH38CNKb9hTM3JQ7TDbqp4f+Zeokw1X+tLNNsNPndypdl6R2SsHurgUhzgnYrtzpQ96WdnIk+U/fOEIytASQc5EBs2is/3tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421286; c=relaxed/simple;
	bh=unaWM7BrO6F4HYlrzqWPdL/PRtBfcelsNoWi1/wzGzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SyBwH2qk65Y6gO04FV6XlS9MccMVsd6aZKSmlYG1JA4i4nDG7yEdoRyZYRgXocFdjab6NUZFY+saWVosgql+1tc7+TOnZFyIOF49g85a2Z9G/V7OVPFh3BJ5qWBDFdlnNnCY6A+UQWNVUsybRyzB0LJ4eLvOEQkouDEecRFPwOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=IDd0MOAY; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="IDd0MOAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1788421273; x=1788680473;
	bh=unaWM7BrO6F4HYlrzqWPdL/PRtBfcelsNoWi1/wzGzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IDd0MOAY5akUlOL70WgsQOXjtdCUMxerD7rkLet1xhynoIWleEh22Ownb54Nk7G76
	 Udgjw+hVxDzr6j8lrKpGpCOIm/O4yxMPpGdR65XowD1iL/z4WShmQtWjeQCnkoPT8w
	 txTl8y6Uo/9PQ1wqSfiTy3r2O7JYlsGdIuK/5NOnSQZPaRnaDR26npa2aEVF9POmPl
	 x8cKyiLVXEcv1MRYi2m7pxNzpxbG5N6tOpahKz/NZYYX1aY+NIzdd5TqFjAQV6/4RW
	 iY9fI35FiHsE82CzlEPvRe3yKF5Ow4LtDhHDO7DVY/TS/QS0aLmnl2wWJ3d7uBS3Y6
	 BcIH8UVierCtw==
X-Pm-Submission-Id: 4hbBNl5shzz2SdmB
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	daniel.almeida@collabora.com
Subject: Re: [PATCH v2] clk: devres: fix cleanup in devm_clk_get_optional_enabled_with_rate()
Date: Thu,  3 Sep 2026 10:41:08 +0300
Message-ID: <20260903074110.101285-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <apib9XCsTNGA3-u3@redhat.com>
References: <20260809095413.150069-1-work@onurozkan.dev> <apib9XCsTNGA3-u3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 02 Sep 2026 17:58:13 -0400=0D
Brian Masney <bmasney@redhat.com> wrote:=0D
=0D
> Hi Onur,=0D
> =0D
> On Sun, Aug 09, 2026 at 12:54:04PM +0300, Onur =C3=96zkan wrote:=0D
> > devm_clk_get_optional_enabled_with_rate() registers its cleanup action=
=0D
> > before setting the clock rate. If setting the rate fails, it attempts t=
o=0D
> > disable and unprepare a clock that was never enabled. This issue was=0D
> > spotted while reviewing "rust: clk: add devres-managed clks" [1].=0D
> > =0D
> > Register the cleanup action only after successfully preparing and enabl=
ing=0D
> > the clock.=0D
> > =0D
> > [1]: https://lore.kernel.org/rust-for-linux/20260706-clk-type-state-v5-=
3-67c5f326a16c@collabora.com=0D
> > =0D
> > Fixes: 9934a1bd45b2 ("clk: provide devm_clk_get_optional_enabled_with_r=
ate()")=0D
> > Reviewed-by: Brian Masney <bmasney@redhat.com>=0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> =0D
> This series no longer applies against the latest clk-next branch. Can you=
=0D
> rebase this, and submit a new version? I'll be able to pick it up quickly=
.=0D
> =0D
> Thanks,=0D
> =0D
> Brian=0D
> =0D
=0D
Hi Brian,=0D
=0D
It seems that the fix has already been applied, but v1 was picked instead o=
f v2.=0D
I sent v2 the next day after receiving warnings from the kernel bot [1], at=
=0D
which point v1 had not yet been applied anywhere.=0D
=0D
[1]: https://lore.kernel.org/all/202608090025.dwxdfqFr-lkp@intel.com=0D
=0D
So this patch itself is no longer necessary since the fix is already there.=
 If=0D
you still want to get rid of the warnings I can send another patch for it.=
=0D
=0D
- Onur=0D
