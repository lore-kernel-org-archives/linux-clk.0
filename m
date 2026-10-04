Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF9843E48B
	for <linux-clk@vger.kernel.org>; Sun,  4 Oct 2026 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116019; cv=none; b=LbrQTWK4R6DOYebswB/WNPGHAJzkZQrkpuhSBufkI2d2Va8iMc7oHl9pJNoBGa/x7YeacdtLICXjVaiammwvQ7129SY6wl/NTL0ZN1/MMfvuk1i5o0KxZnRCfmTegtnEFIAMdc9Mg/Sdsx3BAmzO3/OJo5QQk4l9K+NCIQ58s6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116019; c=relaxed/simple;
	bh=5Pr4pI6UHbC0U2MKjSQsGnO4riVPy06dn9dWWcRzV98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p6OFDt5HakGtLBxa1CyuHQgScx2ktHDTcIH6mWeEIqTqaxWW+hYcMG1KV3wZMLouArGfub40eyEGOJB9rp4CtmwFyhU+FXPH026NN/0qSks5/eubR1m9EzUW2Bpw7KFe+0Kt3PkC+lARPpgX8wFOa1QgvscJ1GNHIZzo0GBQ+ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f38.google.com with SMTP id 00721157ae682-8ac502960dcso6524817b3.1
        for <linux-clk@vger.kernel.org>; Sun, 04 Oct 2026 05:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116017; x=1791720817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfYr76LOTu8jVRzggIwBN8xVUqu42mEkcSJCjGTgQ0g=;
        b=DLWeoWYwb6J88BidInKDdYRf7QvQEEgaqCt/Z6vc5tP4gypmGQFw5tblRyd4I7/gFQ
         gUhgkVdEd/Y/hyd8Ea8tU4ZLtSVDoaj02P/W2GWeeikSDdoIXJmaklb8lwcitJx/fGRN
         dw4ON1of3N6EhSuLGQ5wIqSOL9k4DopjrgPSnEcWxLIDRHVCqFNB+/khiCEkXJLdRjC5
         v2ZxS7A+5m5pVKvZRkQj1/FiLV1nH1cfG+TIZbfpCpQDvbcwcz+njfGBSqP2VKiIcpeI
         T1nulANjJifKtPH1y1Egx4AF6cUq32WH3SL3n5M6KzxXC/uvaC27n1N/p6Prx9Hfpx4J
         uR1w==
X-Forwarded-Encrypted: i=1; AKwUvBzBh86Q6rp2j2HyrwbqswH1er8q6otuLjcbdcaS6YOXAhO0E+F0gH811YtroaXWoJFsm3BooeTtuac=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3eo3i5kDnApkrPzDFDcvAGCtjgVtscVU1J1bnXwQt7SzE959i
	s9HOuWjhpJcr12KUiChI/5AEGrucSkVy2t2MG/Y0l0JdD/1lB2oXujZrn6t+0LZM3wg=
X-Gm-Gg: AYBFou3zIQmjydj+NtMvWU1hHbtQXsj2kD8Z7YyOEXclJghrs31cqcgNq38c1F+M1/L
	1IqBD825wVP/BY1Z8E7A2tenFVl2QHM48c5KXW9px0JSWF6tAvwzDLmq9x52yj6s7BkS0aXToaa
	EhhUFEuWizAcVpz6VvH+IO+J5Mwzafarjf5T+igUsrNrLsulhaz8PMZZcjv8RXl/r/OnYksuJAS
	0tZYld/LqVUACtXtTfga7IHap5l63XuBz3UOkaDqh+UJnMF6fYLJqleEge68FU6p4tcjYcIQNC4
	69Ibd87oSJARywA/MHDgM85LO5cSfP2LWeyy93a87e5lHcHPTjisTXMohdMpLJATj1MYiPdHA6j
	ZbxzbXI6CEh22IPrdJikTbZHinGPG2r18EETtGrTHFQD92UwQP1wSyeZhEbmQy593v/30kwpAWh
	H6mVfg3SGfH/lD5EOUAeBrluLHfZiSLSgUHxYMsg+vBtAxtvsXItQ/LCFBFsr256MRH+WnPjg81
	nmLUGIgyKwaGTBPRYjV2TXf5va9JQ3wzT3sQAxcozBtBb8oon64ZpzwpHc6FTCc
X-Received: by 2002:a05:690e:13c6:b0:677:a99a:8107 with SMTP id 956f58d0204a3-677ac0fccf6mr3127513d50.105.1791116016833;
        Sun, 04 Oct 2026 05:13:36 -0700 (PDT)
Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com. [74.125.224.171])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1a214sm1636113d50.6.2026.10.04.05.13.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:13:35 -0700 (PDT)
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4ab201ebso537408d50.3
        for <linux-clk@vger.kernel.org>; Sun, 04 Oct 2026 05:13:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzx9tgPfCCJAyJqfCzPC6QlLTt0CRhXdmSYFDVfpLpMJHKxcejqon3JSr5VUTar9L3Noc/nnZnXxis=@vger.kernel.org
X-Received: by 2002:a05:690e:d01:b0:66f:7e05:c3f8 with SMTP id
 956f58d0204a3-677ac00785emr2680725d50.42.1791116014048; Sun, 04 Oct 2026
 05:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com> <20260905153234.133217-5-tanure@linux.com>
 <aqSX-kUvYaixESxe@redhat.com> <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
 <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 4 Oct 2026 13:13:22 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+0T=k44tHbJ5BSAsD-RvpytA6mLu1FKu_2GZgYucorXNw@mail.gmail.com>
X-Gm-Features: AclHuK8rosb4K--WkyZLuEcRV46M1KSWdwcM-4rWMY7HfYobH2sNfTEc1o2MX3w
Message-ID: <CAJX_Q+0T=k44tHbJ5BSAsD-RvpytA6mLu1FKu_2GZgYucorXNw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 4:51=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> On sam. 12 sept. 2026 at 08:50, Lucas Tanure <tanure@linux.com> wrote:
>
> > On Sat, Sep 12, 2026 at 1:08=E2=80=AFAM Brian Masney <bmasney@redhat.co=
m> wrote:
> >>
> >> Hi Lucas,
> >>
> >> On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
> >> > sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> >> > between the SD/eMMC controllers and the NIC_MATRIX fabric. It does h=
ave
> >> > identifiable consumers - the three MMC controllers - so marking it
> >> > critical was the wrong tool: the clock should be referenced from the
> >> > consumer nodes and claimed by the mmc driver instead.
> >> >
> >> > Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> >> > sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself =
and
> >> > have no single identifiable consumer.
> >> >
> >> > Assisted-by: Claude:claude-fable-5
> >> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> >> > ---
> >> > This patch depends on the MMC controllers actually referencing the c=
lock:
> >> > the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> >> > clock must land before this patch, otherwise the boot hangs and memo=
ry
> >> > corruption this clock caused are reintroduced.
> >>
> >> This series should be merged together in one tree? Which tree? I can
> >> provide an Acked-by if it should go through the mmc tree.
> >>
> >> Brian
> >>
> > It's definitely best to keep the series together in one tree to avoid
> > boot regressions,
> > but I think the clk tree is the better fit since the core changes
> > revolve around clock logic.
> > Could you accept it ?
>
> No. This applies on top of another change already queued in the amlogic
> clock tree. It can't go through the MMC tree at the moment.
>
> This clock is not critical in mainline right now, so
> 1) I could merge this and it and in practice there would be no
>    regression. The problem you had would still be there until the MMC
>    change lands
>
> 2) Or you can wait for the MMC stuff to land and re-submit this in
>    the next cycle.
>
> Your choice. IMO, (1) is fine.
>
> >
> > thanks
> > lucas
>
> --
> Jerome
Hi Jerome,

Sorry for the late reply. The MMC side is in next now, so the clock has
a real consumer.

Can you take this patch dropping the sys_ampipe_nand part or
should I re-submit a new version dropping sys_ampipe_nand change and
only marking sys_am2axi0/1/2 as critical?

Thanks
Lucas
