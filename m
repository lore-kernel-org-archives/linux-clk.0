Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032614AAC40
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573243; cv=none; b=DG4JzGEefaBIXB0QKJdE/qOofTQC3G+PNItDR4dBzzvl4NG+j2EYuzS/6wP9TkblQQCZASFwxYM1xhqErRkVXCDMBvglhMZXjcnf2Vg51bH56OneIRZeoSRid/oI6JkpgvuZ87+eJWuHvCqMmWunz0RMV8VCr5rYr3rgg6cN7Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573243; c=relaxed/simple;
	bh=9pCihnM3FbjYGVi5wLxsUnfSo47K2lILwYEk6sdnzaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaZKDkpaNwCk3TNMwHMaRlSCDPgRnxi+qmZilyxZcGLUeCVD1TH/bk9eBuge/WioFfZ/fNC7TTFCcfQ60RmM6RqSJivSExBs0KMsXX3aIP9XaOLa5m4ykbeGVeUvSuVT+ypxk9AR/YO9uC+L1UkBROwo77lSa8oQIl+iucxHcps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e194227so326300e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 08:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573239; x=1790178039;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fboq+NK6sE1xgxN0EfjzW/gu4Sq+vQLBzrzcGneycFo=;
        b=Egd7/2NqutCaH5jdbAd854Q2cnCevOWLKK+8P4ZKUnsXxy7KjcbncR0RONznwMRi2z
         T3WeGAmVH2QweFqNqlqF/BH72fH95mdXFST4boA6OHmxNUSRRgWTAxmDi7or8Y+o5UiQ
         SoZyLmmtpZ+0hSJeiGuH97FqMgiumb2OGJ4p9WwWmJFpLAaDUbt2GfMofgSoVRFxQ8DE
         A/XXZWShN/w00iOD6sUMecdlTm7P+Do6e7Szj76jsvcThFeDih3heeV8BzzHr/Kw9RYT
         udKrpBAPNig1ExC7VCeIZUbfFm5sDiTykFJ+tqqRUugHkOVHO/1ig4YfnWWtHk7gxvkf
         EhXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXf0eOetVxjVKID48WRj0SJqtg4IYv6039yoM/C6lcOnLZ48hPEL9MtPJg3jB+Zdibn61UqOB54KY=@vger.kernel.org
X-Gm-Message-State: AFuF++nAv/WR9GvYgwVcKU6Z8Y0JpRdL4607W5aALw5814omFIsnkyM1
	I2lz4sw4a1hUZXan+U6cLuLCmM/VBT8NYBIQhwm68r0Pn1ZdXGvZFXBbrEkVTtsxU8g=
X-Gm-Gg: AYBFou1VCmEDRWLxRhMX3I6p6xtn1t+ccByqVuD62h6SAP9g2pAQMjmW/eL2gVeGmj3
	Ur5nfoR3kP3CYS1aVLPf6gaFjxNRJ+Am/H12K/RpfFApjOZ6i9M9yTaYaRNoeOGZOSaza1lSvz9
	neGk4+xB8/e1/5tjp4PeG/Uie8IWoIMASY51dpmltaybt/P8I4F3ySB29ujwPxSIon41RXQaF3w
	/F15SMblqRhozmz9cbCkI/2lD1o0GZKQee0dxhR0At65TjfLOrEc8Ab6yiJqa1VNfn3RI4QZtAk
	I2M43RT1IrWJ8S/Hbn4yeBplTKQWRBFnpyBQVhRNxy1Cxo+8URM/WL/Z/M4CPo3/T32o8WxBZDS
	zVgi5+ceEKDv+qv8mApyR1iH62bJfPx6BEKF9GHLFVf8jF+m2QuKfrdNnLmrX5POXKr4qVh6Y46
	6xb6cYw4uXQOy13TVadVK2z63vtdjsJia33DXv9uC7QNzOIVIlmNjj1rhfBv4Yu81AzVXFUutNy
	ZAOo7EB5k2vw+IGSNhtLj9lyFSsE8ww+So3
X-Received: by 2002:a05:6102:81c8:b0:798:24e8:23f4 with SMTP id ada2fe7eead31-7a1e9931973mr4706137.7.1789573239339;
        Wed, 16 Sep 2026 08:40:39 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a1e2329d15sm102090137.3.2026.09.16.08.40.38
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:40:38 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9830aa5523bso1364845241.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 08:40:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHWXlFaQrt6LdrFhiXd6NHjtNLmbvhlaMeSVBwLs9D15ghfHXKtjKbuART9C3jGV2jGWSnkU4zenE=@vger.kernel.org
X-Received: by 2002:a67:ec11:0:b0:797:c1fd:9d87 with SMTP id
 ada2fe7eead31-7a1e7943469mr59486137.2.1789573238729; Wed, 16 Sep 2026
 08:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87bj9yvu5a.wl-kuninori.morimoto.gx@renesas.com> <878q52vu4q.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878q52vu4q.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 17:40:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQUiofvEVwE-ShW61nEudqqKd-kYR6yU=yQr1SpB+rEA@mail.gmail.com>
X-Gm-Features: AcwNN1WZzoCkTGlVWoKiyI76sQkG1ugXvQ56H2D2SN8hXm3ty3CNS1u79jGX7IY
Message-ID: <CAMuHMdWQUiofvEVwE-ShW61nEudqqKd-kYR6yU=yQr1SpB+rEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: r8a779g0: Add ZG clocks
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Anh Nguyen <anh.nguyen.pv@renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 03:54, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Add ZG related clocks for GSX
>
> Signed-off-by: Anh Nguyen <anh.nguyen.pv@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
