Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37CC126F0A
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 01:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769218471; cv=pass; b=NV7OEFgqa28nIYEJehPMsLeMxmvI18VKQ3Ov2xK6cSxw82A0/oZYWgM22UtEKn0nCUt8r9yjzdL786Z+ghFVicbRvWCR/thgDS8Cs+il0sRpugQXZz4hPjAABcd8Ic8B4puuPGuae83t/jr2WCLj/L7mq49oKiOXoRlwPC9cnaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769218471; c=relaxed/simple;
	bh=Zk4q4K0se6+SF2hBrk5rRcLDLK95kFoVe579bDxPx5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4lWibVzuqkvtQoRUgbRemDAwSma1iwHe8gE+xCLVU8Yl8XAqCaku+u831a3fmPm4UDIHHv0TEdqF6hxiUgDChuEfhoGcQKFLDWNRetZTDSaGsGVaRr8qoJT4QSHcGGHsZ+9dutqb1zFHRsHTrVWWc3IxYKMyZDnqFlDpRCwy2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=WktcV58A; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="WktcV58A"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6493937c208so2657478d50.2
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 17:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769218468; cv=none;
        d=google.com; s=arc-20240605;
        b=Mu+Nw1FdLymKuF2zr9ezqSEjBEZXv7HgXnWWHHAnnWDkygMcWbDHdQTQUPlv4HxQwr
         vExdZLl4WtHm/W7qcbWHV+PK0duEn3PwMayYNO4zT+dmvB+NTFo2XzG0rodXEE203I+C
         L8du91o6+67LA9xuylDjDFeutkOWc8IMhQ96E6/BzI6hMhHLMByDXwIMzxxF9RnguXpH
         D1MDUSn4LJaFUXPimE7xxJPISbCgKJ6sdCVlcqaW68iq7vAwnTxxI0ut6gGAWomga35W
         6NQRmjmYPBOs9Oh4J1dopH31EQaqQ8CGGkSyUNh67ccYFaNA/iTRaQSiHDdCzWkwiL6l
         irGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=agEgREMLVDdazclEpRe8zfrv759DuR+/W32J9A7FeaE=;
        fh=/VCgAJGpbCSV+AW+iSJnoDx7CF8m1o+PO8H6NOCKzfw=;
        b=YuzcRpC9DIL0/7FoSg2N4qXqZPk0EHy43Tk9s+JHkk38sW2Gb7L+icmLPV+CcdQYNI
         mycv4iDf21fUZjMnJXktek2LPK93G4+jUws/d1gp4Q0hA5vVCv1UMMkJO6ZV9an7HrmQ
         pgqlst09DL77q24M5VlJxUAV3z5hJADapNqyOgHsu863uguMvifEYkprZ8tgUa+wyYLZ
         ok13j/qDKeBmS0Fls3QD8Dw1SUNsOcbFegGPpV6xweFcP6JfZ77GNyGfQ2lhu4JrRsX+
         CDCXEit2uFrikSH6u1mQctEKwvVX54oGSVhvy4GZDvn2p2d8hSXKTaUUs8Q6Cu0VRi8M
         Xb8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769218468; x=1769823268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agEgREMLVDdazclEpRe8zfrv759DuR+/W32J9A7FeaE=;
        b=WktcV58AOq5TdIcsYOXtWNNRWNuAy/tHz8I5MSbs+dwEaeBMDLn55if2w+hpWORSV7
         dYRvg7uYukJHubH/MXzC4C9Zrka0cpJDP45XDE+fva5z7nfqjt0SWU/DMjC7r3CJ3WSL
         0bGcyJdBvl+5naN/+Bw/LBsL1JfJgJ2Vjxcpd4ViFHU9AGS6TA4e848xGpnC1KY0lc+D
         WUBuZR5zvlk7nkhaAxGdVS0KxuuemMbIj0Xarn6hy8OnZ4XmjqsYCfDcKm/HnwDHI0WZ
         l5YcIotbXbXw4W5yMGwLqFT1RXlVY8RosBSO/L3RNIL5reRQO6bw5lu4+gEN2uwGtzXn
         dM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769218468; x=1769823268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agEgREMLVDdazclEpRe8zfrv759DuR+/W32J9A7FeaE=;
        b=ejAOO21RqYhPn0HyL1hD9Bz0q7hbhFF/YjGV+90qiYgGJu8siNl9C0KjeXy3/5IbzD
         bZEXpmAAaYi45LQDH0zQyDfMNSGuAx4UwbwPnsDxSgAJ1/WJW76tDC73338AtLPrkn5S
         wZVLvxlhjFhD4CJ8AFSuVEtmGyfOvlg6INvsdkAYlmw6OeFWNs/QgCS4/sOCCHeUVZ3P
         A9lx5k4xDbzXZYYT8MI+Flc3BFuxht2amg9aDvl6IlSZHO4HNdG3z3WCDTsb2r0kng6X
         KnGDFtcnrITHBa7fE89q5GFjui2z36zgHuYDyetSQasKme49KCx49bKgSpwaK0XkfR9M
         /1YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV44AKHmIMqQywqRak5x1IvkorsgUjHluWZmm1U/A3YCUK+pODfyCaW5PaTBDMdrWvPStJyphF64aE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy96e3S37Q50iXoQTrM+lqa/0MZNRibgAsSf1XcJQApu/1V0J6J
	o0ibJ3oGAtqG7KE9EWJgJhtLOR8cIuZrFuKvIt4IlKax5JrWYujahM+wqOQjSaLGseZughNHKYZ
	HuNj5kviS9mZysjn3yXfjzbfaK0aKioupwQhVN8lL1Q==
X-Gm-Gg: AZuq6aLA2PYtUqoo5DZlvLUSN6OTYwhz37qfWBR+YgvChkkoqVNtXE5Z1I5Dpk7QSW8
	da9No5Z5RsJjueg1yhm8oaksYyldTw3vZJOrxnjLMuUh+AskbBCE+/SQcHDZQdLo6eE+kfxY+wO
	VqmJQnq2E6M7UcfA/v6jes+d/NpGZwv8fz2havzgQNr8qJBrdgD7hY45W25+WwBMbtBtfygEUWZ
	cNgHsokoQuTIx1g+KE3Z49yuSEJYGETmMfgSJB3iRmSpATgxUrdXDQNGi5SnvMcj5bQ9FFVsBll
	RTMesLV/oqfGBYjaFB5OGg47IjkWZI2nLazVKarcTXobfrfgLLs7AcYFucHA
X-Received: by 2002:a05:690e:188f:b0:645:5d39:2543 with SMTP id
 956f58d0204a3-6495bed2248mr4358820d50.19.1769218467721; Fri, 23 Jan 2026
 17:34:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com>
 <20260122-atlantis-clocks-v2-1-c66371639e66@oss.tenstorrent.com> <1bde71b1-1a7f-42d2-afce-c206269dee6f@kernel.org>
In-Reply-To: <1bde71b1-1a7f-42d2-afce-c206269dee6f@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 23 Jan 2026 19:34:16 -0600
X-Gm-Features: AZwV_Qh-aoeQQcUuaKT5O3JGbzcURLIxf1lZ82LX_R-DdXFUIZwX0O2uEAEQO8E
Message-ID: <CAEev2e-WqFJR5QpT6ObQCrQFaAnCGt7HyNM4Q7CaqQCtRJAcSQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: tenstorrent: Add tenstorrent,atlantis-syscon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Fri, Jan 23, 2026 at 1:10=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 22/01/2026 23:36, Anirudh Srinivasan wrote:
> > Document bindings for Tenstorrent Atlantis syscon that manages clocks
> > and resets. This syscon block is instantiated 4 times in the SoC.
> > This commit documents the clocks from the RCPU syscon block.

> > diff --git a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorr=
ent,atlantis-syscon.yaml b/Documentation/devicetree/bindings/soc/tenstorren=
t/tenstorrent,atlantis-syscon.yaml
> > new file mode 100644
> > index 000000000000..49fbe2423be0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atl=
antis-syscon.yaml
> > +description:
> > +  Multifunctional register block found in Tenstorrent Atlantis SoC who=
se main function
> > +  is to control clocks and resets. This Block is instantiated multiple=
 times in the SoC,
>
> Please wrap code according to the preferred limit expressed in Kernel
> coding style (checkpatch is not a coding style description, but only a
> tool).  However don't wrap blindly (see Kernel coding style).

Ack.

>
> > +  each block controls clock and resets for a different subsystem.
> > +
> > +  RCPU syscon serves low speed IO interfaces on chip
> > +  PCIe syscon serves all PCIe related functions
> > +  HSIO syscon serves high speed IO interfaces (Ethernet, USB)
> > +  MM syscon serves GPU, display and video processing functions
>
> Same feedback - clock controllers go to clock, not soc.
>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - tenstorrent,atlantis-syscon-rcpu
> > +      - tenstorrent,atlantis-syscon-pcie
> > +      - tenstorrent,atlantis-syscon-mm
> > +      - tenstorrent,atlantis-syscon-hsio
>
> Why do you call everything syscon? syscon is not a hardware name. How is
> this exactly called in your datasheet?

I picked the syscon name since the block is a bunch of registers that
control different functions in the SoC. The block's name in the
datasheet is PRCM, so I will stick to that name and treat this node as
a clock controller as its main functionality is that.

> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - tenstorrent,atlantis-syscon-pcie
> > +              - tenstorrent,atlantis-syscon-mm
> > +              - tenstorrent,atlantis-syscon-hsio
> > +    then:
> > +      required:
> > +        - tenstorrent,syscon-rcpu
>
> else - properties false, see other examples how to do it.
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    syscon_rcpu: system-controller@a8000000 {
>
> Drop entire example, one is enough.
>
> > +      compatible =3D "tenstorrent,atlantis-syscon-rcpu";
> > +      reg =3D <0xa8000000 0x10000>;
> > +      clocks =3D <&osc_24m>;
> > +      #clock-cells =3D <1>;
> > +      #reset-cells =3D <1>;
> > +    };
> > +  - |
> > +    syscon_hsio: system-controller@e00c0000 {
>
> Drop unused label.

Ack.

> > diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h b/=
include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
> > new file mode 100644
> > index 000000000000..053cef2b43c8
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
>
> Name will follow bindings.

Ack
