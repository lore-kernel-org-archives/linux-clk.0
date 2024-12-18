Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5920B13E3F5;
	Wed, 18 Dec 2024 05:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734499163; cv=none; b=VUsHgGza+6PpTUFzqTiHKwcshvt5NfIRaVg38f51Qb1a5tvXotQaEwvHAicNxYSecUqUJFlVPdsSU0Wu5NwdCdkm1goFY/kcXxUG79tbfiKytECX34h4uRdPrxrhoOBTzum8ok0Nbv6LO6QcYPH5Ba1L3QqOx+B3vDmZElWJvGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734499163; c=relaxed/simple;
	bh=YaduQ6e8+9CoGIBaQv2NAm8/6H/QtPEzXpSAiy2Btqg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XwgnstSR2xiRzWGwR8GzPaqUd+2PMbS1913C0JAcxbwXdm9tdXjKTkuHNGVZ3s1bkW9Iqi519JIP2OthhHIU3uqiuUAJ+LjhbFx/HQO0Uxhi4zIVhqtjpHRQMXzagF9Qd7r0ew9dE+H+p+kdDEu0JfSuP+JFlW7ydUQ6+LRLfxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=La82PDwt; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="La82PDwt"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1734499158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6r3EXwOyrqA1TPBa3Q4vxINguWxtsGq75OcL5iEtwr4=;
	b=La82PDwtrWr/Hzv125gXlcuqYlFr0IBd33yM+wIzOWQXEcaBQZOeOagv2xXF/52wBPFFTs
	ebzWKHIWI8l9j/LbdtA2TInnL0qDcFS7pRUxfgOU9Lbse92fezNajbH6qUg07pJDre3Cyq
	OPdarmzm59fRDK2A1RoNcRjKF74RrFOy4DsHdvJrLYkPk5SKDG6rzm6EggvCTS5XUH4/KE
	NbBxBs1YfOmBfwp8M3GVXK0EheLAomM3SlyYDDBRs2JL4Y0aXggOFPex2g+nACuvn//isi
	F2p0jsntNOP+zDIIzQkklu4+Fi/PO33XEeBdAOx36Gz3ZuR+spjyusXqpBIR5A==
Date: Wed, 18 Dec 2024 06:19:17 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman Beranek
 <me@crly.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and
 PLL_MIPI
In-Reply-To: <20241218013836.421cc616@minigeek.lan>
References: <20241215053639.738890-1-anarsoul@gmail.com>
 <20241215053639.738890-2-anarsoul@gmail.com>
 <qbtp4jvkx3r5azufe4k3vtapqpfs54dyjiu4cy5v5wkkzumrzx@vy3xzkfplbue>
 <CA+E=qVeQ8uHBCeFtw6_2cY3252-YXc6eWrf5_YdeVgbp5LJo5g@mail.gmail.com>
 <20241217211505.7f9c9e4e@minigeek.lan>
 <d0bf0d9cd2df65dc2e17eb203d56eb13@manjaro.org>
 <20241218013836.421cc616@minigeek.lan>
Message-ID: <96ce1cce894a8bd5aa302d5f5183f64c@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Andre,

On 2024-12-18 02:38, Andre Przywara wrote:
> On Tue, 17 Dec 2024 23:02:43 +0100
> Dragan Simic <dsimic@manjaro.org> wrote:
>> On 2024-12-17 22:15, Andre Przywara wrote:
>> > On Tue, 17 Dec 2024 10:00:45 -0800
>> > Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>> >> On Mon, Dec 16, 2024 at 11:33 PM Krzysztof Kozlowski <krzk@kernel.org>
>> >> wrote:
>> >> >
>> >> > On Sat, Dec 14, 2024 at 09:34:57PM -0800, Vasily Khoruzhick wrote:
>> >> > > These will be used to explicitly select TCON0 clock parent in dts
>> >> > >
>> >> > > Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
>> >> > > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
>> >> > > ---
>> >> > >  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
>> >> > >  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 +
>> >>
>> >> > You cannot combine these changes.
>> >>
>> >> The patch basically moves defines out from ccu-sun50i-a64.h to
>> >> sun50i-a64-ccu.h. How do I split the change without introducing
>> >> compilation failure?
>> >
>> > You can just have the binding part first, adding the (same) definition
>> > to the binding headers. As long as the #define's are not conflicting,
>> > this is fine.
>> > Then remove the now redundant definitions in the kernel headers, with a
>> > subsequent patch.
>> 
>> Yes, that would be a way to make it formally correct, but also much
>> less readable and understandable later, as part of the source code
>> repository.  FWIW, I find this to be an example of the form being
>> more important than the actual function.
> 
> Not sure I understand your last sentence, exactly,

Ah, sorry, I also saw the need to expand that sentence a bit, but only
after I had already sent my message. :/

> but what Krzysztof pointed out is that one part (the header change in
> include/dt-bindings) is a DT binding patch, so part of a spec, if you
> like, the other is Linux *code*. There is the DT rebasing repo, which
> cherry-picks DT patches, so they form a separate history there, and
> Linux code has no place in there. U-Boot for instance pull this
> repo now on a regular basis. So keeping those things strictly separate
> is really important here.

Thanks a lot for your detailed explanation and for reminding me about
the DT rebasing repository. [*]  I forgot about it for a moment, despite
being active in U-Boot development when the repository was introduced,
so yes, you're right that we're now in need to keep the bindings and the
kernel code separate in patches.

However, I can't stop myself from noticing that the way Krzysztof 
replied
left a lot to be desired when it comes to friendliness in general.  Such
an approach is probably what contributed to me forgetting about the DT
rebasing repository for a moment.

[*] 
https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/

>> >> > Please run scripts/checkpatch.pl and fix reported warnings. Then please
>> >> > run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
>> >> > Some warnings can be ignored, especially from --strict run, but the code
>> >> > here looks like it needs a fix. Feel free to get in touch if the warning
>> >> > is not clear.
>> >>
>> >> Yeah, it is not clear what do you want me to do, assuming the previous
>> >> similar change to sun50i-a64-ccu.h did essentially the same, see
>> >> 71b597ef5d46a326fb0d5cbfc1c6ff1d73cdc7f9
