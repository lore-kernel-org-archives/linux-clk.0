Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691071A38C1
	for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724864623; cv=none; b=ftPgRrk47RPAk1C937W+YTr5pTFbdWm4xFmN4LIuUVIg87gBEuOn3RPckzgGx+L1V6+uEVKFP6xRs7abBKhsNouXnUvYwVs5w/lJt5HUuvEyNqixb/b/oZ0/iaj1f+oNQizXi9gzOSX45M1oblFpUlyrfTlbQWSqXpvhmXXYyCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724864623; c=relaxed/simple;
	bh=QasJiYQ1cDw/pStQicO3S8JcebgaLLR56R+OjX3L02Q=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTrRKY8quIm4sJMArdnTHIMlAyiUFTDLq9ffdQTR03UbEOKRvZitF5WPmLkx1sWi1wch84aFfR0EpRwBCGFrGiTcg/robHnbhR9+46k6PMm6iWfMUsNmPWtdf5fcJyB5DVwcocFP2Jvs11QmK1KtIexnccPf5ySch62qiACFn6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n/3I1wkM; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n/3I1wkM"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7a7ff6c4fd0so23153285a.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 10:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724864621; x=1725469421; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QasJiYQ1cDw/pStQicO3S8JcebgaLLR56R+OjX3L02Q=;
        b=n/3I1wkMOKH+bGMxL+yQlzYfp6qROm3K4v+wypIb2F2NGydGx7NvkwnFFoECDVTYPm
         vDoA97XRSHkf9PaWXySsakpKfQbooUxWJHeNLg/veERRbwVvR0Bs3REW/8wglLdHHV5d
         b38bqXOLIpis1bpZC9cMiuA/maV5T3pWaE4Eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724864621; x=1725469421;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QasJiYQ1cDw/pStQicO3S8JcebgaLLR56R+OjX3L02Q=;
        b=mBIjMZceMZSkdck5gVoS7uGI9j5BeBSA9mma9uFj37+CaZItmLM1cji3Qh+PoeQE8k
         iweSHoRvfvASo3OF2gr+tNyRGtccjeP3BSeUJFR4h2T15Rdk3s+c0QV4Ij4mEz8XG68P
         QCpIzei6LfKNSo0gqSTubmWj6vICR5lzkNiBeS3mZn1GICZXbYk2M83QzaHcSol2zcpb
         YStGH3vc7QdEZNGM7XTEOxen8qX83OViQDuzSc02viaJGac0rm3A2S8UsNPpSIbISh+E
         H+pRG3SgnSLg6h4ckJ+cJQs2GvrOhoE60u069KmhRJ0fJpf4Iz7Y6o7WFQWa7jQaBl/W
         sPRg==
X-Forwarded-Encrypted: i=1; AJvYcCWY4ZABC+V0KVUyLC+MVqomRaX9+cVJDIpkazA0J5f4JztutUlp1MF9qtJ36fL97TT5PiXmCJU4TRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwl4yNrhZ/jOJ6L7busrZfoAWDIHf7pqSLnKkhC/ndGEVnrEN2
	a65t0+2Q3tkoK36xHEEQsDFqYNvI86vUEsgIMU5S1wkkMRKkG3u3b57PfiHU1BkZUL4ZupejQ8J
	ScEGbYPBiAUscbDUwhKHkWhgJfEeSxOVjQhBT
X-Google-Smtp-Source: AGHT+IEVO9KZmNWSFybfc7A1nURst7111SB2+UOWqLJ8aG+gb/58BS72acni8VLoQAEGgDW7MBt6MwGtixuxjlVQbiw=
X-Received: by 2002:a05:620a:2496:b0:7a4:f480:c315 with SMTP id
 af79cd13be357-7a804182b1fmr3651685a.3.1724864621186; Wed, 28 Aug 2024
 10:03:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Aug 2024 13:03:40 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8597375d-6c15-4d20-96fd-2598805c09d5@linaro.org>
References: <20240827231237.1014813-1-swboyd@chromium.org> <20240827231237.1014813-2-swboyd@chromium.org>
 <8597375d-6c15-4d20-96fd-2598805c09d5@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 28 Aug 2024 13:03:40 -0400
Message-ID: <CAE-0n50_+ci9H4M74FC1xVF5szE7kULFifEEnE+-DxaivGG-Bw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: qcom: dispcc-sc7180: Only park display clks
 at init
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, linux-clk@vger.kernel.org, 
	Taniya Das <quic_tdas@quicinc.com>, Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Neil Armstrong (2024-08-28 05:22:25)
> On 28/08/2024 01:12, Stephen Boyd wrote:
> > Amit Pundir reports that audio and USB-C host mode stops working on
> > sm8550 if the gcc_usb30_prim_master_clk_src clk is registered and
> > clk_rcg2_shared_init() parks it on XO.
>
> Why does it change the dispcc-sc7180 in this case ?
>

The patch that broke it affected all RCGs. Let me add that detail and
resend.
