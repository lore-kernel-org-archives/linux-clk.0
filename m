Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF044238C07
	for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 20:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752525590; cv=none; b=Ru+3u9ulvQaZnWVGokQY0klf65eUSX+uEUE6gnTrQhp5FowEUlgUWedsNb4/qDBYudMgKhgH7xyuag/VKBtyPQxC9/Z4/MwRFAtCPRXzvJi3U/V6nFh/6SMc44xy17/hO/6WTgrIJdxceAIwiNJp1GGVnwVd2wTC+VdjVnKtN7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752525590; c=relaxed/simple;
	bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqtPG8u1GxLaietEVKfMoar2JCHx7wcdbPk4BCs0fLeQoMQpuXAUj1IH9XizUXfXjQ/dRJj8+Tko0EU+Ri1dEeHtKybF14YowAtV/XMtO3UPtWv4Xiw3NxedSPEpdpGzdPfQME3HTybMWQKJ4k0nP5udwW9Bgl/TUMvrq6mEccs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OzNlYLId; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OzNlYLId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752525587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=;
	b=OzNlYLIdYDAd8+9cjindWi/I+J+Q+UVaSYovlrT63RkOpWVx1JSTJ51GCQnvweDh1+5Q+1
	W2F7BE0Z4RLdiimV6fXqhyVbGHhvLiS0+JSWj2G4mu6+EAWMwpSFc7U6M32/DlO5vcPbRz
	eESzXrJMUtKMQ/UTZgLlX3BqrvjRLv0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-wjRfM9CpOkit5UhCU1C1_w-1; Mon, 14 Jul 2025 16:39:46 -0400
X-MC-Unique: wjRfM9CpOkit5UhCU1C1_w-1
X-Mimecast-MFC-AGG-ID: wjRfM9CpOkit5UhCU1C1_w_1752525585
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ae70ebad856so208433666b.2
        for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 13:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752525582; x=1753130382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5y/8SUZq0rdm2xQZuA/Ya2xOqAO/MdvVu8D3Jo9BDM=;
        b=jdl/YSp0gJjqhdGqmVC44yqHZLwsB+Uirt8vvKcIbjbvxyHnpc1XYF4uZeQEIN4xYF
         uGWHue3ikdbVsyPTnDD1D4db/RGe+q3sctKtW4a9ChC7hdBKoqkNnc/HJlI8vmbm2i2B
         fPOZRl1N/8GIm0RSozH1HlwexA2OZvArOB17WKTYnZsJPZpuyGQC2roLHzDLgjvdu/pW
         YZDFWtQWHuqvxHB9PkRlFiDONMy33y2AqRK3+RyNcj0eACXE312sLEmgBGVL7hX/Xp3e
         RNGazP3GR7DzkN4mX4+CaRdMsKqOeCIjSFHHcNjCh+QBWzUJ+crRizjGyvUwV2/2Vf2I
         asHw==
X-Forwarded-Encrypted: i=1; AJvYcCUeRLL5XZhJCQTcH97SS3mutavz+nN8Z9t6WZTkS9RQq0+ZbmJ4ZEUtjG8m3tttUOYz1qVKalOEZH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuO99RTft3MRjc+SodZJlmqC8+YPyAomdEGlsHYtBqoLMHKh1X
	28D4mfYvNcTWvZBamwiH5DLaXbfOipWo/ov1TzBN0wldO55JbtxqhRmo1y3W+hx7KGEjiHLlu3u
	JkYsHX/JRyuV3g3dcT4WVSClI9CbZjWlm/aPda3sZMgCSFLt7cvwKF9ZZfdzklX58ZIbL7hrmv3
	QrDWDSytaA4KZuv/oJwsZdim4nRIOG5kfXu7zp
X-Gm-Gg: ASbGncvfw6e9+oWKDyRInwArOvrWgwjqlQtrB3lbED0haY0ww4x99gmmvDGeSWDi6uK
	+38/jTFOSTGdYPaUOqf2A0kZz6uKmV4jSBmpjovca4G6WLCxBkWQfvXH665KLxqv3wbieb60NfC
	V6LnCd6dzQoUM4CFkXroVJ
X-Received: by 2002:a17:907:84a:b0:ae3:a240:7ad2 with SMTP id a640c23a62f3a-ae6fc6aa6dcmr1561811666b.2.1752525582624;
        Mon, 14 Jul 2025 13:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtOtCIDm5iIRXUzH93pKL+mJg2YxukWxSYyuAjAlCNSpCWGK9PKhS/khXgGAJEgay188lilBak/nz6CZiqGvQ=
X-Received: by 2002:a17:907:84a:b0:ae3:a240:7ad2 with SMTP id
 a640c23a62f3a-ae6fc6aa6dcmr1561809066b.2.1752525582243; Mon, 14 Jul 2025
 13:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com> <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
In-Reply-To: <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 14 Jul 2025 16:39:31 -0400
X-Gm-Features: Ac12FXxNfqVieUoHNPgnW-EodFqKMjypw83pf906bEoCpdOuQyrxKsmWcymmig0
Message-ID: <CABx5tqJzEMUXz0Cbo5siCnwKp2MVON_oGgMnGkb_cg1zv8k5nw@mail.gmail.com>
Subject: Re: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Thu, Jul 10, 2025 at 12:09=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 7/10/25 5:51 PM, Brian Masney wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > on the cover letter of this series.
> >
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> come to think of it, there are a lot of drivers that can not
> do any rate rounding - perhaps we could introduce a NOP implementation
> in the clk core that we could reference, instead of copypasting
> int foo(...) { "return 0" }?

I'll look at that for a second round of cleanup once all of the
round_rates have been removed from the tree. From what I recall about
the ~200 or so round_rate implementations in the kernel tree, there
were maybe only 5 or so that cover this noop case. QC seemed to have
the most from what I recall.

It wouldn't be hard to make a Coccinelle script to look for the noop
determine_rate() implementations.

Brian

