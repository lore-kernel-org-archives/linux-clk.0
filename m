Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B3C5650ED
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966903; cv=none; b=EyIqKfsKSDEB9SyFM6dLTcxI8BfFqKXxaGQuak7VKd4yNd8U890kUCr3s5sVm1UGAsamBZWyhfg9Vxeo+AEUPyCfu6PK3zYdgi0YgfWUk26nYqYvYf96H2CLym8Om/G47reTz7YqZXBlxEOFEGTHguqDOE+oDFBtp0qj6w4H32Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966903; c=relaxed/simple;
	bh=CECANy83eJ476WV9+m8Z1DPlG6IR5GvieLQvKQjJhkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVaRZh08CZFWK1eY0FAX/RYqgdOvh8/oZucMx0Hm9r+2AQyo0N8MjUxZIFKdrxaYGBHild+Uvb6pp8ltL1gbMQNAWRqPlEBrPzHwaqkhrWp08qC1B9K8tP1GrnxfLbnyMdG0vdY5oStSAz5TdF+OTxG/hHCoDVLnCWkYbnpZYhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so181979e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 08:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966900; x=1789571700;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=haSiNz9f37NiWVNy2OnhpaaLVM7uwzgfEK4yu5ZD+M0=;
        b=Cnev53NZ7ZtzEX/5dztsj6I4us6QQSG1EH/+AtK0wK1tvFb7T7P/cd/kqiKBEwYTOH
         +S1a1clp0CL+uh0HZrvfnIw25IoaOIILMRYWDErRRWc74zm3rRQ7APm6dZdImf6MH1gP
         5gIUHrXBBOpAcjVS/C5xTrgdzVz+iV6O3DCvXtGPdKhtfINBGX2JxOFZfYxt++6iaX3z
         iOw3ukU6MeWr9uzvZ1+nlKZHY0aF+kNfiWcAbqyKe16snA0k7JXssF8UhDxQE6iyxw0b
         jgIjvKzBWm/+inwGiYsZSxR44KbVYDEPh8PtzLOsq3CuY2Cnlvyfq+2WPVIZL6xq+89q
         8N6w==
X-Forwarded-Encrypted: i=1; AKwUvBzzYhe4qRvzoWE4FeMCz5D652WSHh+lZiJjGHfzp3eTV/AVgKqyi5HjyWrs0jYdznXdLgapM7UIj/4=@vger.kernel.org
X-Gm-Message-State: AFuF++mA+vOoS26dNKGROx2hahzfXo7mAa9ZVP9hWNrhvKmOdSMQ6ALT
	KyJKiCy4vMBl4F2LDzFwYKW4Ec1xCEfcR6ewFlb05yWa03E18wTQDq3xI9hTdp7rB0g5aw==
X-Gm-Gg: AYBFou1rJ7kyR17MMgO0Xd6J/XmhC+t5r8DTwbxZ9rbeEg3PGFNgxlwD7VO8JETcuqQ
	ApuV0dZikGwRC39zgg/SjrfvLLTqcOpDhpyvkU3vjxq4EAuGrD07cBI/DqDXS61ZnLXOuTEQCqG
	NusYcZjhWJ6Ef4s9zgltyE+Mf99aGmsyblWsnos6gozRfaXRr4xXb4Ddfz1Vn3cm4JUlFKW4Pd5
	d1JnNQanIeGyrF/CBwhfZmD7piVk53eH8ki2cVB5JGAjteevvlhEI2LNWTG8egkjmw5CASAkRfM
	mmxAiucdvgR4BTTx59y1Omn0ts1ODctTEy0i8RQmjo1wXK8QnSyP8Pb9jsR63UiEUnmuNawuSdo
	KlMdY2hupMIRLYERjxdXfPnHA6nex0aeUm/E5RrdsVL5JEty4tltY3VOMJhNxqJT5uEAWeYB5u7
	0BaIXoCY5Y09qlOv1Wpvmq20EvK7+cvuOCHW0DdHovrUPHh41jj2i5B5oLA9qUGHsFWxU7mEe/m
	z6Ww8VmqiUROk/YJ/1Ewbk0hJkSvFmXJpri
X-Received: by 2002:a05:6122:4692:b0:5bf:9f77:477a with SMTP id 71dfb90a1353d-5c83342f602mr1369778e0c.2.1788966895059;
        Wed, 09 Sep 2026 08:14:55 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b2cb1sm12389237e0c.16.2026.09.09.08.14.54
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:14:54 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78564319a92so85633137.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 08:14:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjWOIuT/EmC0zWfFDTl6pCu1CzpsPkr7jFRfKBROShlhPx5dDeQL0AnoQTOruQ5oDV5FFZFNyoBBs=@vger.kernel.org
X-Received: by 2002:a05:6102:f9a:b0:786:7a59:a313 with SMTP id
 ada2fe7eead31-7907800afe0mr1252914137.13.1788966889473; Wed, 09 Sep 2026
 08:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:14:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKQMn_3ZeCmjdPH1KiBDc83Eodp5vhOd+yZYwz7p0sJA@mail.gmail.com>
X-Gm-Features: AcwNN1UB2bvnyx_MDMU6btLmRb2JR3XbtnsQvALz2JEMNNgbbOmmr-5JjuTx89A
Message-ID: <CAMuHMdXKQMn_3ZeCmjdPH1KiBDc83Eodp5vhOd+yZYwz7p0sJA@mail.gmail.com>
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Add a new macro subsys_driver() to eliminate some boilerplate code in
> drivers that need to register earlier in the boot at the subsys_initcall
> level.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
