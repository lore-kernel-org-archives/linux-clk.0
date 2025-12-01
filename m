Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2882D1DE8B5
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 06:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764569573; cv=none; b=Hgv6WMLgV+LcHCNihQSgT4/TUSEmpWjLxk0TZxZcCZ5v53bFs2NBAQZVOigmbaNFl1FWcFjQI+6SoEmuUE75J4EM2T/5GIk/qEgyDAHM6PMmbBXqTnVrbT4OFeFBIsR9hq0TIRkWsK2+p/fzfw78jLW1wVhiLsJudyn8cnGBp4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764569573; c=relaxed/simple;
	bh=0gqWOlt6q0VnzXoDw9gLNI555RhmJF/DyPsr1omshpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ib957cPH7VomHVoCpxiHVYE1ZcbxtnXhrJ5Pnzbehw8X3sVTgfa7XkRBRDnvy8Vk1ksosVOvyY5Za2oII2TefogL9JuVjPHZZTo2J8DWu3nLp0+tq6S1T8mROkLCn+T6bsaxQB4zZ4ietIGzk3LMaCfmZl/xJwA6VTo4eHBFxp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cxc7gSbl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cxc7gSbl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so37042285e9.3
        for <linux-clk@vger.kernel.org>; Sun, 30 Nov 2025 22:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764569570; x=1765174370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gqWOlt6q0VnzXoDw9gLNI555RhmJF/DyPsr1omshpk=;
        b=Cxc7gSblD1kga+ixxfkqqpPpnCHI0Jz0AG+H+hgkm9NfsyZMfQ5xqTge0YWVxuZAFJ
         axrtJVbwUJyDcqjZ8j6Y1xeiPfWnBdKDMwlWMHn7aKeTh8SHWHt8Z0KuzYyH7Tk7rQcG
         cTQugrgVVnbkKcrPUqw2Tq3vb6uzPYSToLQFdA44DzNFFmuCVXZazqWnLmEfMeg7tbKD
         /Juc+JgL5qVhgPmwB5qbPxAR6nFFVNmdWQcjl8KWz5Si8y+BYfOqX7h9h5xuwCPq3yyQ
         aKpR+VlNt688rjvG7vqfKAmqnW41/gGJONRM3RppPA/3jU1zAsCxB2e/lYwdWhWnCvfr
         2RvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764569570; x=1765174370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0gqWOlt6q0VnzXoDw9gLNI555RhmJF/DyPsr1omshpk=;
        b=XHsRU242D9uw4oQfznQD8XHtC9lyy0Ui7gge50YtgVCxy1HxxQZy0uuR7ywMMsEJ9l
         II5FR7BzvrVRzk2Ug9QlWKrkc/j6lAqp1b9JiGa+EPF7rMKWuTl2NkPPLhZAD06/R/tS
         TOYf1PPM7YW9C/sXtzDYXG+m+LRlEXyb2lM8iaeoLvZx5isLq7vX173KWgTB3cwAtHWt
         hjNGoLVAL4jM08ckZWxy7+R61DrBDz6FoxT6elaDdnTH2MFvZsOMf4UDbp6sR6MeNOQ5
         I9NFg5/pki4mHmBWPO9Jvaj/K++REw5CNNURyIxMV8QlUMcwbAklscjzK4YGtMGNafTc
         4Wgg==
X-Forwarded-Encrypted: i=1; AJvYcCUi0skebx4EEN1eD0YM/JHVXd+20+OxkEFSOPRZP0HPf39OFProqHRFZkxCSGYsCnUFbUY6/1BNwl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAyeykPRnlzlhNAFjOE8g85wPnRP5YZWfGhVwaTETMqDet2p5s
	VXNcLyc9I40D/jT31bfbq3huAbLytOPcnLDqmuh+Lc28GM1eDCv/mQI3e+Nda9UIDBc0ex3IanZ
	nQgU6rOEhqV2Bm3zKKIN1wSUss+8sOM4=
X-Gm-Gg: ASbGnctWK0T0fmbk8VXvVw9UGeWnolsERMX13JByZKoUj5RgwHTc2gWxk7Ytw+j2SRo
	YXbTaten+QY9JuX6RdzSuZb79q39W37jKS6Tp/9QZTF/oDe6um5eJHTT0mf/3nERAgifBzt/xEO
	ZtGc5sPTRBrQE2yy5wRt5sxrmiSybnG3Fl1UQL8HpQXeOycPXIUsadU4JLD9QsRoBmvIC1wVh8f
	sD94pobmp7MtTyr2Ui88tSIvcFcjn9EZ4Qps+YUMi/2f6TjzJPNfKO4P0TfDBSjnzRs6uqX
X-Google-Smtp-Source: AGHT+IG3M3ax/JFTY6r/6kCAKUsAn9FNfG4fATSRqdxto/IaG1LWGYFhzL7upnvl0p2HSyGlz3IJEPgGEFfXgAl5Wik=
X-Received: by 2002:a05:600c:a01:b0:477:55ce:f3c2 with SMTP id
 5b1f17b1804b1-477c111d3camr385466695e9.14.1764569570297; Sun, 30 Nov 2025
 22:12:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125120559.158860-1-clamor95@gmail.com> <fb3a497a-1e48-444d-ae98-f764d9b5ebf4@kernel.org>
In-Reply-To: <fb3a497a-1e48-444d-ae98-f764d9b5ebf4@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 1 Dec 2025 08:12:39 +0200
X-Gm-Features: AWmQ_blKNbLhm1nZrpgeDj-g7J0p0JVXe7hTB25EN5hsiX2ADUE2rw8DoOGBpiY
Message-ID: <CAPVz0n1nk30=UwR5344c+rk=n6LCn-nnzLCf=CRfWOUPDw-rqA@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Tegra114: implement EMC support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Dmitry Osipenko <digetx@gmail.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 26 =D0=BB=D0=B8=D1=81=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 10:4=
7 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 25/11/2025 13:05, Svyatoslav Ryhel wrote:
> > Add support for External Memory Controller found in Tegra 4 SoC along
> > with adjustments required for it to work properly.
> >
> > Tested on ASUS TF701T (T40X) and Nvidia Tegratab (T40S). Both work fine=
.
>
> You mixed here FOUR independent subsystems and without any explanation
> of the dependencies it means things are just harder for us to handle for
> no reason.
>
> Please split independent subsystems or clearly document the merging
> issues/dependencies.
>

All commits are independent and subsystem maintainers can pick commits
which are relevant for their domain. No regressions at the build time
nor on the device itself were detected with individual commits picked.
Only device tree changes are preferred to be picked last.

Patchset is made this way to show logic of implementation of EMC
support for Tegra114 since a list of links between fragmented
patchsets will not bring clarity nor it will improve merging
experience.

> Best regards,
> Krzysztof
