Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB82F314D34
	for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 18:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787768558; cv=none; b=MfBkHQ9rTFssUkloUFWUgfDxQOlsZpJdmI79q2XL3agZ1KS5oh94sEyFyqIFLWxcREXeq2YRfnQoNtN2p/5sW4uao7uK0/MnGDCt70uiZNQOUGqV6s4HzPhUnqxPnilPiR/r+qWk5RNqDenstLOsjKoy1ap15OmvIE7yfW7feA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787768558; c=relaxed/simple;
	bh=jTmlZ1wXvKzIljpCaUXSV4XW6lKPvt9wsBPqLa/JBsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qkvl6lIQKXoBR4MRV9vXl0278/QrminlvjysQkAMr+KDMOMNVoXSJQ9c9yxW4KyZdoSO5kX9ijloHPeCICSHp6ShM51KyjR2CuIoDy+S5wIKCuhCuYTmYf02XIYstRRNcHcnXe1tM61jNpaf3OywuVzt4pYBX3GFuyp1u9wUxKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iDZoe7Z3; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iDZoe7Z3"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15e2dab83eso202593166b.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1787768543; x=1788373343; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYcEtx+4FYWxMZlHfWugGZUKPIp0WScwtuxkWCMrWJ4=;
        b=iDZoe7Z33UKMLMiMsCzMeCS/oeGYv4ChCvfY5CiJhowWP5UAQoekkL5v2GYUaneztZ
         Pa0euqhAHPjuQyXqdR9dUg+W3wt2ZtrpEEBhKlZFlfPXhC/zcDtSHi8rQHr2D4nUt84C
         9OZ141r9GVjfnvnuOKKn/LHS3e1VaQzTrgjMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787768543; x=1788373343;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oYcEtx+4FYWxMZlHfWugGZUKPIp0WScwtuxkWCMrWJ4=;
        b=oqItJq3gQtINyDtti2TzQep9Tnuecq6bOjK/VUI0MNSBx8pX4ahrNHrtO/1+h9iF2q
         miuVEH8eO1V86PyfrxZ0EofwkyA3DTbu+cFEzBBkzfVD1qN5WD2Ra/iY2LaG5cONTLAw
         JlOlt2lskkyWLSNiqGswkt32cIkRKHeOVE/DgymBBPAjtcdufFy9f+QrTLGFKCiM4Nn0
         YsZrthHLRGWEWKwVSK10uzmeFdbiV5mViw402niJsOYyP17oIduJQ/XHPkQehb6l2Ee1
         7kjBvQUxC2D/GpJ6oloph9pvo6aE7SXhaf8IXGwIs9udGMgksUD+RKlIXzyJdPAv1qi+
         6M6A==
X-Forwarded-Encrypted: i=1; AHgh+RrduS1K6IP4UCAHQFQ/DN1/9RdHOJ2L/sKfetwwS5ck2CyAmNevOELwrXYPkmQ8zVXL8CqCaQXNxPE=@vger.kernel.org
X-Gm-Message-State: AFuF++kOGWeEIgMahGio5btd1laXs21vlAo+w5xS0dFy2uvjoBb34cCS
	Wn4zVbUmINzeinYOSHZ0NuUl2QA8YqaTDtD+dvlUPAVK3LSprYiCzxAlri5IvB29kFW3nAfW2hC
	wzgx8fzg=
X-Gm-Gg: AR+sD12DgTfV1Yyr2KIuwZ6+BZuLaTRs+l6TIfOzrC4xUqNINBOB/easBxxQEjWn/98
	9/dSLSD9xsBPqMfDqFE7xpn7EudKJC10XpTxXiIFgwmWte/I+1M6CqMpCUEUZQsrnjUq9m3YQv2
	foeC5sM6+Vy0sg9Ie+UVL7ykqE+yeTzRpIenf6a4BksSD6E48QMWxyWWE8SHzWd0g+Hce12CaGA
	+1YYu91y9vZd0mMJJc62DdyvhzcCb99wqFlAUxE274XfRxi+DxeA0MvamLZvL4hodUPEMLSh9sj
	GAtLpn/O1oi08Z8lNfC6kcRuPBtI+HF8qf17NkQ2/wt8sDYfkwREUP/WvNvrF0/pTEYTFyORywy
	22M8fAC6+lcrjfd6iHNvP/PF5UFrlrcdKdO7ooFAS2zKuXoeewls8vs1Ac/UppYNrxmbQc2jRAg
	Uqy0tfBfb7Cy+HWugwi7KtpH8Jk+oGsW2t6cYUHoTGJ5LvVfJIJH3CA+wVJ0lNkzmdAqus0dkbu
	yEWs+Kbbf5MYYOSZHLb5BnilP4rBQlbNeEJFg==
X-Received: by 2002:a17:907:a890:b0:c25:254:292e with SMTP id a640c23a62f3a-c250ba594bfmr1126750466b.0.1787768543380;
        Wed, 26 Aug 2026 11:22:23 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac46sm687924966b.29.2026.08.26.11.22.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 11:22:23 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a17cb94b26so2313679a12.3
        for <linux-clk@vger.kernel.org>; Wed, 26 Aug 2026 11:22:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RocaMihg2Pq3Ly/lznbyKtbdb3JwV9uBavVyJqKH1jJrqwkedi/1zZPDIesS2EqpiiIAoqKKNe2JK8=@vger.kernel.org
X-Received: by 2002:a05:6402:a518:10b0:6a5:ed9e:b490 with SMTP id
 4fb4d7f45d1cf-6a5ed9eb54bmr5775087a12.14.1787768541885; Wed, 26 Aug 2026
 11:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826165611.236321-1-sboyd@kernel.org>
In-Reply-To: <20260826165611.236321-1-sboyd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Aug 2026 11:22:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4E36NECbZBm0aesRX8mhatYXUEaMB14qkBshppBsdPg@mail.gmail.com>
X-Gm-Features: AcwNN1UA7xTkHiRv6GsJ45N4NAts0TsSm1q4h6B3rGFnD1QjSWWqH6dShkE_8dI
Message-ID: <CAHk-=wj4E36NECbZBm0aesRX8mhatYXUEaMB14qkBshppBsdPg@mail.gmail.com>
Subject: Re: [GIT PULL] clk changes for the merge window
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026 at 09:56, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Finally, I kinda buried the lead,

Nitpicky grammar / spelling nazi time: you bury the lede.

I'd say it's pronounced the same way, but considering that "lead"
pronounciation depends on context, that's not actually necessarily
true.

We now return you to your regularly scheduled technical discussion.

              Linus
