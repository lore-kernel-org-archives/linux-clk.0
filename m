Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2841D12FF80
	for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711383613; cv=none; b=aVY9rfBLO35bwVSsGtP4mEhv8xJkzwc6PaDYTNqkuf+KSCj3H6LdB0Q/IboacIafnuzQ3/4L5lPeuPzaIZuWHwERLeiEimWScPH1xikMIZwYsPs2mNcixc+C6rS4Xs/JgBapv3BHjKaPvhxl7suW01xW3m8ffX7I5l3xOD7fbEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711383613; c=relaxed/simple;
	bh=A843Ssrq3Y9wYnaYppe8XjmG2PpCDGW6HiDXf0QJKws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjtPJ6AZM5DsBNYRKd1N8W4jmlSQOclSrjPtl6z1j4xzjmSP1IWmLoFDwKShd2fqNVwvQQHHgNI/gCVG7AO7TM8C2BVXVHDB9m+hzyRUd8yCPDhbfxBuLC1lHMhcxHkProDesNGkPns6dJBhJSHK00zhXkRxnNKTZ3JG0ww5Rm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n19dpSU2; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n19dpSU2"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-789d76ad270so317310485a.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 09:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711383609; x=1711988409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9xAtZXJvpwpsev5gWghEp0MSIRB0SQuoLdXgBJreDE=;
        b=n19dpSU249zLiPm5edX5Zp2uHEo3MCkOcxs2fSxJybq6D7AinHeGetOAXgwzGEtTAS
         yn948OrHgMhG6D0oLEuw7ZN7//CKVGgSvEOuIF8ADc+jZly5EbkMkhfjeXUk0gLTYMWS
         Pa5oB7+l9N+TT/8dqvJcRXibDS/KVKTYsqQ6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711383609; x=1711988409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9xAtZXJvpwpsev5gWghEp0MSIRB0SQuoLdXgBJreDE=;
        b=WhvoZqQr/cVnrqVb70yHI7wTW5vnyE7elTBmkbMW131oocGvvt3yqtxvohLpL/b0V2
         PVP+qqXU4dkUKVsYMcnXiNJCcjChAo/edZyPJebtKs8r+K639SHWC2X870aIGKkyUYsu
         jUkiVWK87tnmLVr+bnc5PUtjYl2ftAsKo486da7i3hqzRYVcTENRpsQyBaWg1BVL/33V
         XMB3tZlJ0I+Cr876Hp0HTg0LGm0ZnT/IGfHjR0/AcAg+yl57ROsG0lFQ5MbDuqTuooN8
         LfX6SneqipcWMISsZSyy5gsYbsu0y/I0v27ce67Mp6K2B0lDQoxUxqLNAiD/dHR9Jtq1
         CuGA==
X-Forwarded-Encrypted: i=1; AJvYcCU0CilyUPIm5Jj24DtGFGRhI59bzJO7nOWB/f7SAuKrK7v9NEXFhARCiMleFVZ8mg+aEknihrOeKnYkLiPIsCHuChdrwbNh7/4B
X-Gm-Message-State: AOJu0YwArSLQ5vnTwwpQMaHZGCSRo/ypaArR4qdMrd2g+B+RNuuC3Vkk
	3HnYnTKPQDGN0mSgoNP+7YT1xCV0Ctgv1VtETvW+IwyzcDZUsdEmgcAX8E74xf+sla0jfPJoZIE
	=
X-Google-Smtp-Source: AGHT+IFsjNweCX6Pp4bixKnLjtv2GDYI/KHulUTQQcD1dZaXrwJS5mmut3pKDMU4UJKWxT/2VuV6VA==
X-Received: by 2002:a05:6214:e88:b0:690:e164:312d with SMTP id hf8-20020a0562140e8800b00690e164312dmr11855399qvb.52.1711383608800;
        Mon, 25 Mar 2024 09:20:08 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id 8-20020a05621420a800b0069680936f00sm2380900qvd.10.2024.03.25.09.20.08
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 09:20:08 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-430d3fcc511so468041cf.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 09:20:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMWAIRDXifFOzASepqYW0CgoXj59YynLVNQcYAaIcx8iojFTL6a56Sj4UGU6rAzBegnF6yHBHwRp93homunKNBDUO9dKDjLA7H
X-Received: by 2002:a05:622a:3c7:b0:430:a5df:a3af with SMTP id
 k7-20020a05622a03c700b00430a5dfa3afmr1093586qtx.5.1711383607574; Mon, 25 Mar
 2024 09:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325054403.592298-1-sboyd@kernel.org> <20240325054403.592298-6-sboyd@kernel.org>
In-Reply-To: <20240325054403.592298-6-sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 09:19:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X13_5Kubq3A=y8gnz==6tt2bsfc0PiFAj06HX9V7_+mg@mail.gmail.com>
Message-ID: <CAD=FV=X13_5Kubq3A=y8gnz==6tt2bsfc0PiFAj06HX9V7_+mg@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: Get runtime PM before walking tree for clk_summary
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Mar 24, 2024 at 10:44=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Similar to the previous commit, we should make sure that all devices are
> runtime resumed before printing the clk_summary through debugfs. Failure
> to do so would result in a deadlock if the thread is resuming a device
> to print clk state and that device is also runtime resuming in another
> thread, e.g the screen is turning on and the display driver is starting
> up.
>
> Fixes: 1bb294a7981c ("clk: Enable/Disable runtime PM for clk_summary")
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Shouldn't this also squash in a revert of commit 1bb294a7981c ("clk:
Enable/Disable runtime PM for clk_summary")? As it is,
clk_summary_show_subtree() is left with an extra/unnecessary
clk_pm_runtime_get() / clk_pm_runtime_put(), right?

Other than that, this looks good to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
