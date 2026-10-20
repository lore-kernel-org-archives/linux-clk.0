Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480503;
	b=0MnMUvFHgxdH+dZ3yL7UB/FSM8ej0HzL6IpC3c+b6yDY85LrOvaM2vH3EbAinZWHeYbn
	 H4bLsX8oVRpZPiENFEFaxWBI0wc4DKAWsk5DxgddfRTUgvzDNnypXmM++lLPvPBVTGQah
	 wrsiSk8WYHRjOhiigEkDz74AT725aRqKSGpeV9MKW1+UXJmrAgsVwGIDF7eVZ2vgZHGQA
	 kEaZim8slAIbOHagAJPZqBNRl3Bm5uTv/xj3aGPtnsB/gQr7deG3snkM5XfMh0TfSJkUl
	 uSEhtsW4fkiiaHn8+G/ogjKLFVcm7fXOURYQrhC1/nWeTt3U+ufQw33JmQkQAs9dFlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480503;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PPF5Lg+md+ScchRlISc/5Y7zr+t9DzuuY8wGaLIwWl4=;
	b=ZKi+umUMpdVjHx//EGn7ebYxKNKHLS7K5Fa3N6NV25e46Le1539oBKyn+O3NU+D+Vi1h
	 Q/Als6OwuUXjlck2zGlNij7xEZsPruSMj2uzauHqIBJ0SQK9IpTzfpDNAMkvLLq+7n+92
	 W4PN1O2ws1mdCltInyxzR7HMK1Bz7K5BFtY9MBsuv25TXDf4mUcHbj/C59nNLU02IbBMV
	 Aa5D8p4W49iSDc6wHDtF7UgpEo5cK3ppaG/j479xdXQSIM2eoXEzylBR8Dev+CVrq3vjc
	 BXzK1+EvMZg1VhQCN7r9NuJ0H6D9imSKTGqxF5VN27BN3gp0of0QGaLb9i2i0NSeweA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8315606A319
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8315606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5350d9ea106so35473291cf.0
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 00:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480501; x=1793085301;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PPF5Lg+md+ScchRlISc/5Y7zr+t9DzuuY8wGaLIwWl4=;
        b=qPFmnBLld0rHyqmcnTSqW8OirM8w3NLX61n6S8iv+UGwpHAkKMu+k5MXYchRfRPZja
         zTil0Te92og06JtawcTHKLLnQoHcyJUjgX6brdLlLzYzFUlzll7RpxecPXpiBQ44SsoD
         Y3PuLC4BdW8AGZe/2HIbuIka3X7QtGCeVJk1TWCkPAzd1OP0A/p9IoYIyHB3oLGE0arE
         8zoN5pZojxfLouftka6GNFvbGCfdI3HowOGa1BN2iB2hhqUEjrlzhakIOJC5QZHD4hOf
         YMkY5z/g9S8Uge1tRl0lML55piIyyoXym6kkUzVClP48glBj4tWj8D7Hj9aaB19cUkOf
         c3Fw==
X-Forwarded-Encrypted: i=1; AKwUvBznstq1gbsaG4PTvgS6pNI8geIdvbs8aRzEK7Dctj0iA99Bk8vggUpffMFkJ5ypctV+RAD3tF7hVEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9OK3bzvXW4evo0TMfMf3tHgvU98qLKDd0/JdWTn3ByFnSJXfm
	AfqirKtPjF6WObOjnX8t5Yo2BzAlqNQ7/qiYtpZABf9ESZ4373WSQId0yNBfrI6zdck=
X-Gm-Gg: AYBFou2MDFGwD+DHyWeegZrI9+WbapxQAI6xlHW1pyjA7SX83e5vdqFVV/JfMAXzJf5
	SRIS2z7aZskAGcwk/MaoswNseJhnwmCf8lPx2TuqGrUT8QT0pnz7yakToQhD3h2wCrbfcDzL5tR
	jDsHglRgZdnzqsPK+TbKbTjjKW85nTpDNctCBehwV9AMrTT0xUthvaIm2fz0G4UmSsDpWz3YATe
	H9f5bhbhoOKf4u7V36JoQHSAdbQO5xp7UX4aqqgOKv6OI8dF1P66bnYJmDMtxYOaB5U21LvZleQ
	6JbcDgPtdTaUh/Q4/I+Mftci7/DoS2M/qN2Wz1F8XkQKJBWFC3yHXlBpYmKdF91ACkD9G6yaZBf
	G4ea76EEZDwTPHiDu9Hmwm0xP9NbzSNvzWVpmBeB2Fp2mkJxNBUoY2BcYLHQNrjueCQldlevlgX
	7RJtMtifXAfIeArN2zqTotB0LzEOQmm8ztM2MJRkJkWSFIK4NHZ5uSeFgkNdwGUJ9/CjDnM9Zy4
	o/H1715M6ASa5piVE3BSHztJeA04EMdjwnZBdMeSQ==
X-Received: by 2002:a05:622a:4ccf:b0:535:70c4:aca9 with SMTP id d75a77b69052e-536460bc998mr145810541cf.62.1792480501521;
        Tue, 20 Oct 2026 00:15:01 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c04a5791asm16516786d6.2.2026.10.20.00.15.01
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:15:01 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53653e30353so22588201cf.2
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 00:15:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzu6fc8DxHqrFhmQID2u2pV/l4DP2QFlk3wRJgcwDHN9TKx7/wGxLhCIhm2MfZFjEeAu3rQPjazLbM=@vger.kernel.org
X-Received: by 2002:a05:6102:3753:b0:7cc:1ace:fd0b with SMTP id
 ada2fe7eead31-7cc368f6decmr2272570137.8.1792480154006; Tue, 20 Oct 2026
 00:09:14 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
 <20261019160545.GC3705@killaraus.ideasonboard.com> <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
In-Reply-To: <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 09:09:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqgRL+rzQ7xEzn88Guy+KLUHmHyMwAdhfHhC8Xopc7uQ@mail.gmail.com>
X-Gm-Features: AclHuK-xW82aBw8g83Y0vnua8_TBb23MC_WawHBUIyGh3Twhft0MuZERm0ITiqw
Message-ID: <CAMuHMdWqgRL+rzQ7xEzn88Guy+KLUHmHyMwAdhfHhC8Xopc7uQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 18:32, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 19 Oct 2026 at 18:05, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Oct 16, 2026 at 05:55:44PM +0200, Geert Uytterhoeven wrote:
> > > Unlike provider-based look-up functions in other subsystems[1],
> > > genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> > > the provider is not found, thus not supporting probe deferral.
> > > Currently this is worked around in of_genpd_add_subdomain() by remapping
> > > -ENOENT[2].
> >
> > But not in the other functions calling genpd_get_from_provider() and
> > propagating the error up. Have you validated that no existing call
> > stacks will break ?

Sorry for failing to provide the answer I intended to provide:
IMO all of the callsites should be fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
