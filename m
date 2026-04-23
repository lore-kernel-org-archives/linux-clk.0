Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC21630FF37
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776930534; cv=none; b=q35CKLCw00DOL59VArE9LFrSsu/hiiKZKFuGPorucrtxeP7447yiscSGV4lb1Qk3P4H0WZs+S9lmKAbCQLUD+zH4cpNNjhbfw7Mag8Y1J58az9QS30Fr9G86FC/sJgYAI7Q8nwqwzK8tuspOfMfDQH1GOkEGaJKGQh43rKhA1R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776930534; c=relaxed/simple;
	bh=bV6aTtX0hDvOCc3SXegbi1yOc8CAutUCssPxRF8+8rI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZbiZFUR35tCJDhze0aE8gXOU0YkpUj/nohbTVaCJGTKfaeXZwtz3dCDWMUr33TKjDMlrrCj6irHKo73Ndtn2Fhfyu7yGm6v5fVMYN0EDWLy7OqeGDtAYCI1g0Jcynczx+ce5T4FD2IzOCirdkV/zE2bP0Ux9gcWntYxu/fqnocM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5675d609621so4792509e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 00:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776930532; x=1777535332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rz4Ubyu3jfWWynl0S5lveC14mxcG1dEX9l+5mJrbEc=;
        b=f94cEAF/Gb1Ql72AeO4G7WwvMd35tl0JHwzzrwjcvgoyZ5xcf4hNuVEsDefxhsOrf0
         yg8q76gf8wv+R7CCvKfdnAniOLeXgGB7z8AMTLdlpj5BCbQujgc34DBJdM8o7gpH7C56
         0Zz60WFda9zlMm8B+j7UVBsHZu+lTqGCrpb3wDtbQQISkZ7Y8zBmEnnPRBgXKAnYmCSb
         acRNo3Pv6VU2DDJY3TguA6VGsSunhtkftyrNqtzJYwkF4e1pbUf6Ekkjvu+kskvpSAcv
         drp6fMHd9r62s8Ww5+47DLy5nihvm4oWXM0rkuFvjtO9vkwGBMbtCbbiYZQNaoR9zXGs
         pzPw==
X-Forwarded-Encrypted: i=1; AFNElJ8w9IpzveKU2bE3wX0rQ5Azlz5D4MbD7YRTccTFJ8Nj9VIqLjl1VcJzf0r9WkUEs1GljxnNNJ1pseU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx69UnS9nM1kVzJrkYBxDLMAl8oLpp/Idax9JZCfaFKuCwPe1jJ
	Fiv8fCyKbCkJ0FOium79fTQSSl3s/sMVyqK6yHc8IMJ7QxC9CMjPdmwNUxnkd/9ZDM4=
X-Gm-Gg: AeBDievQHjtwzd+pvX6oFi/WLLJRL9yd+9DToQfCgjv/ZLWWcY6eau0O4L6BqhFigpZ
	/44Yp2ni3r7+mjxeL92BOWQG/LiY1mUS091bFm+D8nFVcVf/8PcYxFzf8lCk2deNjqtarVANq6v
	u26N7S+w3mhRB1W+EBtgTOZkSXUk1I7u5NI5plaAUM1zy341y2eK/yWHI4NrH4jhPfznUvG5t6w
	ftUVXc0BiCVlW0oN6yh/RXQ1QxeNpeLV4hhWmREAV1qSl+IXyjAz9icIodR6LjI512PvpgZZNgt
	tkGwprE4d3XEFQsYW/ZMbhZz6hyZcf96CK31g943UElwgwSYrt7VWE/N+lHZWLoIYkJ+VtCPLA/
	4HvYBBh0cv46mieAI0PljslE1BqkVUTE38LcyVGOoURLAsJ+FysXx3nPt2vl1iGQ0WmyXZHkUJT
	j3e/dk5gQFnHszuWDvTFrJGGoEBA1S4SbE73pJBxGFYnhCNlaGdJsTTe8Bn1uOGlR17uMeXDCt/
	Uo=
X-Received: by 2002:a05:6123:5d9:10b0:56f:bb91:4861 with SMTP id 71dfb90a1353d-572278284b4mr3012750e0c.0.1776930531700;
        Thu, 23 Apr 2026 00:48:51 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa91bf90fsm11083194e0c.1.2026.04.23.00.48.51
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 00:48:51 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5675d609621so4792497e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 00:48:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ//c/j7YqiIg51HkyZj5jbQSrPHbLcedkV88Rf3lV+5gNI0n+Zr71MP5MNmHxl1nSSU1xCOUL6rDd0=@vger.kernel.org
X-Received: by 2002:a05:6123:5d9:10b0:56f:bb91:4861 with SMTP id
 71dfb90a1353d-572278284b4mr3012743e0c.0.1776930531157; Thu, 23 Apr 2026
 00:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com> <20260326110648.29389-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326110648.29389-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Apr 2026 09:48:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVZfsEHRSJO=C3iuEpa+2k2Xgji3uNxnkyzUrEEtz9xw@mail.gmail.com>
X-Gm-Features: AQROBzDG_5783iyOqKuu3KbfFJR0HwgxpR86ZMXywqtk_FNHF0_cGI7fUu1kcT4
Message-ID: <CAMuHMdXVZfsEHRSJO=C3iuEpa+2k2Xgji3uNxnkyzUrEEtz9xw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Drop the unwanted check in rzg3s_cpg_pll_clk_recalc_rate() as the function
> is SoC specific.
>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
