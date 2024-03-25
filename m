Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C59512D768
	for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 16:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711383562; cv=none; b=UwrsM6j4pn6fkQC49jWmbPx9wc2kFdBVuJxp63oCeTu1FTCPvUoDY3CMXzO6u2H8NXeau26xgGs9v2qK/TZhe510JVNFe7d/SP6AMtX63Dj9/BzW4pRqd8XWOAtIQPyaWOL78fsJ9phDhWXYQ+2wUR4S6/ycYfLXWJBYc3PbMjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711383562; c=relaxed/simple;
	bh=6utOFEwbdwWyQcN7SLxfqSV+M2t5uCbikbD6Z3HiO1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wb0EtbcjZKnaJKy4xLckfHnWWvy9wnD17HgTrzy5yc7rJ6lZe4RvNrgjDahpoK2kPxsMaJ79pu2xoIbglbNWESOGDjeGd9+LZinp2CBR1wjndMN5QPO/9QaIriJaDFqsgJbCuV4rY0DlQtP86sHe9E3tJgPv2CC6rWx/X5/5wbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=COAq4fVs; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="COAq4fVs"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-78a3ca01301so190434985a.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 09:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711383559; x=1711988359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsgsfaYuhO9HIMjIvNDS3p/KRrPkbJlG84J7jcdFiPU=;
        b=COAq4fVs8WLSyhzuZWdojy9732BJkeHAxZ0dB7XPbkCJ+/CVWXgKb/eI2oxfxUNwoi
         2V4n8uuq5JhI3aE8B9SYGBBJGlu9KcmmTbJ5xkurkDXcNBFdZdqj7df0PiOvQwbKvKre
         RnzbZx7pExxulfKCffnMEByko/GZOmini2HWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711383559; x=1711988359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsgsfaYuhO9HIMjIvNDS3p/KRrPkbJlG84J7jcdFiPU=;
        b=MAW3PiYGWNpyhUCFPX912ntmtnejIDPK+TSmrNpeQ23pVw5oLmDgfwe+6Gy+/RZ+nu
         agor8B8YSjubSIXqh22AVZ8CvW15lJC/VtauhKxsOvE++vDwu3zgGaNpc39/tKkC4ZzO
         uQJF4z2t4mSftVw+tvh9oW0O3YzP10/piyo1H/QW9I1oKo7pUssje3wKbM3upUO4uJa+
         X9HJZOtcPvOh+YqaDb19KjClocsrNy04wZ5MEjzhZ1FtSjg9K1BpFzAC2W9eQ8TMEzym
         ZxWNfUPH37iGiEQpxDnAt+ORP6SjIWBLHNV7tD/YT2I6VSfPypJdYoJM9D/zOEj6Inxg
         eZHw==
X-Forwarded-Encrypted: i=1; AJvYcCW0j0nk9Phi3X8/BkBSzzwGlrzeBYg8la3FC3P3r1EOEuQ/k3GNh0I4KtBYxRs4iNwrdDjextmCRZJPmaZzwI6Vuxh5mBE4JWm3
X-Gm-Message-State: AOJu0Yxk6z3geHT2FiL5oasDwxgSBZoTlCsnaLdgH3HvWEJwocbkjQq2
	LJqdyDaxykzgL4LkwV9TKdAby6zJCeuk/9zRBeOzqqMr5RVtl5/tg3N6LLNk5BiC8kmkw97uuNY
	=
X-Google-Smtp-Source: AGHT+IEHS+oT0/M3k2NyFAe3dZ6KVA6C6l5v7IsaZ7Uy/EcrkmOYW5bw4M/0fu+J3X/NiD4SxMgtQw==
X-Received: by 2002:a05:620a:1a1f:b0:788:6375:4577 with SMTP id bk31-20020a05620a1a1f00b0078863754577mr9271256qkb.65.1711383559331;
        Mon, 25 Mar 2024 09:19:19 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id g19-20020ae9e113000000b0078a5a44d0d8sm588518qkm.19.2024.03.25.09.19.18
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 09:19:18 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-430d3fcc511so467631cf.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2024 09:19:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUc94qJrL+MV6x2k2dK7QImBWWXb0O0pWhg9gATtjEOw7MVFOScnaxce0yLS5qi9noKxtgVYNnSsbQl3LfATywih29oH01xPKe4
X-Received: by 2002:a05:622a:588e:b0:431:56bb:2347 with SMTP id
 fh14-20020a05622a588e00b0043156bb2347mr265739qtb.21.1711383558167; Mon, 25
 Mar 2024 09:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325054403.592298-1-sboyd@kernel.org> <20240325054403.592298-3-sboyd@kernel.org>
In-Reply-To: <20240325054403.592298-3-sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 09:19:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wu_SuLcHYQ1bLC-zhV1FnoFor84t-=EERT9mnDdm5Q2A@mail.gmail.com>
Message-ID: <CAD=FV=Wu_SuLcHYQ1bLC-zhV1FnoFor84t-=EERT9mnDdm5Q2A@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: Don't hold prepare_lock when calling kref_put()
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Mar 24, 2024 at 10:44=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> We don't need to hold the prepare_lock when dropping a ref on a struct
> clk_core. The release function is only freeing memory and any code with
> a pointer reference has already unlinked anything pointing to the
> clk_core. This reduces the holding area of the prepare_lock a bit.
>
> Note that we also don't call free_clk() with the prepare_lock held.
> There isn't any reason to do that.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
