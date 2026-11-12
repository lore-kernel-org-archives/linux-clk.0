Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495030;
	b=aEr8oLZ9rDZseP9gLwBnyK+rMURc5/MOBs3vqNoOUEC2F2K7+pwziRjh9ud/akDVUeRl
	 JJXzTpfswAtHTgmmMfW0G37lAnjmM6Wh2N0jRSUbrsAktP7+nHbamTiwRVWH4iMY/ty9i
	 Bzhw576+hyEtIsszdhwHZFBztFg9yhs9mmTwEeyepKi3D/GdgibNsfL0qrMIf9nz0giIC
	 WUQhv6clSnsfmcFJBcpUeaJyeJ/qywvhzfFeNCuQLvKlEJ19+6B415t1Y7cVSPMl2pDSC
	 Gf/qCU7K/23X5Rqt2kehAJyah25pJp5kmAiXvkRpLZRjRq6GEeswyNuxzrnzIKyNtQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495030;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+5BCTHh1J6xXvkZ55mDmFJRrwUlGVc7lU2YIf178GaQ=;
	b=M9AYltvdglKR0ElhNUMB4HeGh4o+vhOIPPh6BKJQ/0tkyy8juNOJM0t2gImaa2EC2vxF
	 oTa+LVQs5aHrjL34bqzbtiTza6K1tSyQszc9nITxpeO+twFowP8x+bz/XYTZDY9Q+19rM
	 WcRPNs4uzdjipHFAm67C0jnCK/VrInhE6HiK4YkBgk1hk4uf19dNEy4sYGx50bl7K70nI
	 S+4T0VIQ8Hy1o0UU6dJp+kbnJ7e+K10uxw3cuYMnD+0xH0ToXKx8hhDcT39Utx3tB49Oo
	 gnQeCDHOCZc0NrS9H5zmjeEMILEUmbC6ApCz38vWF6nabYbyxVRquEpeJ2leLdiUhTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91B0606A897
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 14:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C91B0606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc0ccc2fddso1429866137.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 06:50:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495029; x=1795099829;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+5BCTHh1J6xXvkZ55mDmFJRrwUlGVc7lU2YIf178GaQ=;
        b=XQ4SAJ6yg/nBI6NpGTRH1c32POoSCF+b80eW8d12qq3m5vHM+EOm9t1S16+Ipzd+Fu
         IS7n6saFhw5wdVao+H7OJK0PgK+JqRGmDv3/ZjoXfixM0wjKINn40aalcl4KNLgPP5+b
         Lz7vBncgg+eA72NFOcHClxUU7SWdxOrYklpFM+SaDQva6OQXN7ON9tVLjBBs0vSOfbaY
         7pnp7n5/P2RwZKSHQgl2Sp7yGoO9Ctj07pzLY1QABLzxPZvdqhu2j3i0rBpsb0FCC6D7
         18aG4LV8ysA/bRpFZ1PJgeZbawamKh0uGOrBpglXvaGXNEi5YeUIVlaiTGzJVrgBcg5A
         WlLQ==
X-Forwarded-Encrypted: i=1; AL+hErETsGpC0MckVbwWnKnRdlDXf23kx1Jmm+9pFyst0lNrcTfV5QfVpKgrNaHdcQFp6VuiIsF+8KSBxcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/puqDdxJb37s9H/LhYvWEPBxQAwJSI6ZjnJy6Nip0IhEqoMKUj
	jBsb6LcgmfJbN89zNcJa1OoqR14iM+iLqaqLB4AizCEau38/YLX+lOpurHayV+530ag=
X-Gm-Gg: AYBFou3Sit33gZOAGUQl4JoZ0zeACbe9Tux+T7m9k9nP52V7MLKjWlOnSl3yN+rHVIP
	boh9mE2R1ne7QoZDskFvJFfjThn7P6gBgTnr45S337B/LK4gFRWubaTXbDoF1SbuIg1ztJaSXqJ
	PP4Q2kcRU4x0W3y3/DKaVaj2JHKGvhJz22udnfwJVuHHDIRpfLtVi0fGjSm+fPe9RV9J8lBDTCs
	ho5zE9cI4o5TaRWfiWWlD8IvS8XIsdkbizEHCURIQ7mK2H1XXa9YcAVqU6Cf5YsM1imOBQ9Y2Uw
	Iq+wu4hqNPii5pulxE6rf6q45FmpilyRypYk2/0Oq9ptbFxxUhOVswd/duQQgX8xCXa9rLnUE+Q
	A6z09T+wSX3LlyjEwQQHH2yrREZAYrAjehPjtXB+jL6oux29U0siQD3LK0fGwisoEEw1EbKIkee
	F6vAf3Nl+tFH0sAcBanmP0UbyyMSGfVGCaLcAbw+B22OhQa+yro8iEyDmS9WNw4GZz0zj7dOan1
	+Tpi9jqcT66NqiXBkLOFq1jJqkYAeBNYlWUJ6X7N8RLYFTe79St1mzJXJUuWCQdij2rrGIaO7sq
	3Urgd0vryj+POHAN/0kDjmbOe/i2wPl0r50TFj1IquPmsabG58/IwaD5nERD8sOQZfc=
X-Received: by 2002:a05:6102:f9c:b0:7d2:d45e:5c9d with SMTP id ada2fe7eead31-7d4fb257b3cmr2041089137.13.1794495028882;
        Thu, 12 Nov 2026 06:50:28 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c2019bf87sm6075984241.11.2026.11.12.06.50.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:50:27 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9999f21f617so1161254241.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 06:50:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHLpFjEV0Pu4VKM0Pl11Ocjiv5aoOW3CFREmOgkqeOJBC2EeC2r+WiDE/XzG7a6Hpx6T2hsQmSTamk=@vger.kernel.org
X-Received: by 2002:a05:6102:2925:b0:7d0:5688:f511 with SMTP id
 ada2fe7eead31-7d4fb2b4baemr1940643137.16.1794495026588; Thu, 12 Nov 2026
 06:50:26 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-4-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-4-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:50:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWw2O1k44Rn03VOFJ_0RJAFZro-bzmzP2gSD+Hc8UbPaA@mail.gmail.com>
X-Gm-Features: AclHuK8sy96nMijWIpulMeqo_3YMpISU_WECBzNl3ZKvutsCseDDYG3iuq5rfEs
Message-ID: <CAMuHMdWw2O1k44Rn03VOFJ_0RJAFZro-bzmzP2gSD+Hc8UbPaA@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] arm64: renesas: r8a78000: Add VSP[BI] nodes
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:35, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Add DT nodes for the VSPB and VSPI IP cores in the R-Car X5H SoC.
>
> Use the SGD1 clock as it is likely to be the clock used for data flow.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1646,6 +1646,105 @@ fcpvb4: fcp@c503c000 {
>                         resets = <&mdlc_vio 0x106>;
>                 };
>
> +               vspi0: vsp@c5080000 {

> +               vspb0: vsp@c50c0000 {

Do you want to sort the VSPs within the VSP group by unit address, or by
label? This matters especially when also considering the next patch...

For the contents of the nodes (except for the renesas,fcp properties,
as I couldn't find the VSP<->FCP links in the documentation):
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
