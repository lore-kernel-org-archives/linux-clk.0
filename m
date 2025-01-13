Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C81222CF12;
	Mon, 13 Jan 2025 12:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736773099; cv=none; b=fB1djkjP5kr5I6OxdTBV7o0RW4/qmMYfhkpuAxk1vmP+Sfs1k2KFtsuYCGR+ouy3ANzFoYm2xMP8tQ6qlOuqhyTsm1QIwf3+c0sPSFARCYJNMfE+EFG/1bA120E+NCoFK9XQegzAkE6u7QI09b3IFssfZcRKUh7hHsNKpRoHX7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736773099; c=relaxed/simple;
	bh=tcumvyjiejZ/BdHDNnVeU0Z6orCqX6HbP/D+1e96bQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxiZ8OmOkH4poSBWbzojcY1yFpn4Iy7XTfWYkkkcDGy0iXEemQGDTImJymMG5XxNYJNMxs/ah9uSsVDJKLiq4FbQyYqYbTq5gX85b8VjJvpF67wO6cRKdXK3Jpd99k42BKEiaY/mCagpVmkzUJM8zYoImNIcahBUrOFMiVQmhQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZOioZPJ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZOioZPJ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee74291415so5588007a91.3;
        Mon, 13 Jan 2025 04:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736773097; x=1737377897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QooocJRhLcAF0GXLTHuzDSLGBsFud6OPFDJ1oZ4p7I=;
        b=IZOioZPJXtdUzrur4K0YBFU8nWFLh2+j+Pl5cbCk419pdNyipLPhfdRxqEtqhBamiV
         AV3o30Hnn4b0JQIyWS1CGZJs5O2W2b5GyYSisPdq2rRZoXXkWmXvJvVDHSKU8Q7+8w/a
         5XqrP++e/ajmYwdGFLOoGFE118QwRhUEU9r4Xu6wJ9U4PDb+KnKmjXiwWbs4ZURCVtyL
         uIzfz+NVDinDguBSKrzvSfc131OS7miZ4XaHnA0odXHH0KEde1/ZDCj471Sfw1FFBpr3
         EArVK595G2LeO423jah4TQiuGxa2BgnAZiTVd05A+55MYqe23ls/vYTDqTDCHIEEXKOA
         jCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736773097; x=1737377897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9QooocJRhLcAF0GXLTHuzDSLGBsFud6OPFDJ1oZ4p7I=;
        b=jDMQY2K+5qs8oRxvHjAGbi/wy1h+ZBTt/vzpgyATaT5E7QysIDI8k6u51r/F0SEHdV
         oiB/zg1zCJStYYGrUNyBbow9T7BRcqFjwkHrlGwdUFT3UdF5589c3AhN3BgA/ok/8tUY
         fkstlnXQZ/QiBk0iym/scI49DgPE6GRq6liKia9JsK1phsOAr4umpJapYNcZ9DbBZdh8
         Zdi8I4KWe5IZ6ND7YWgDFZmpDJKvs9T7vc+1jqAug5HJdZvvpmzqfpQC+KXHI1XHLDxN
         zS7hUf+xbYcKQNyOVwyb7SWNRr1sSl8tr/gKTYCK3kPbGChN+GT+USpFs1dKR+gJyaSM
         wOrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbLqqqHEGuj3Ma6BQViK/SP9nfxBEWto7cqq6pEsuOS/l/r5YQEs7NgYqJWCH0s1PPCnhURo9KXr4uf38=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ST0RrSs4PRkbnWuMakepQaICFrZL4FDQHSdD/JTUd5tnZXyd
	q5mf8o3QmhkEXT4tlOTNrw8RZgPKjBtKu+kFdLLgEM4E+03ue8qGO8sVnWSkbV/41TJsESs7ggC
	UFaP4QAZpodIin043MHGtlk10l9I=
X-Gm-Gg: ASbGncuxtH9yNb0EfC14EylX0m2SfoYEU+zHeRVDgyAQYRcQlxVYdfCLrS5RmNMcMzj
	BKu0dhpU9jeLQFWj359ZG72ZeVfdbu5bZu6Px
X-Google-Smtp-Source: AGHT+IHNmEymTs/8QaQXL/HKKd/cAq3hMCuCB8IfB+cQvjzR1Z/cmVgLXqVpP6y7UCO8xhGtLxy0isHJo5PzxgZ9Qe4=
X-Received: by 2002:a17:90b:520e:b0:2ee:9d65:65a7 with SMTP id
 98e67ed59e1d1-2f548f447b8mr29690471a91.29.1736773096824; Mon, 13 Jan 2025
 04:58:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113082818.345939-1-sergio.paracuellos@gmail.com>
 <ebb32bec-3fd4-4129-ab5d-d519b10c4405@kernel.org> <CAMhs-H9ysdJ9nUuStWJpRqTzm-09ZS5TMdhWgKMZx+JZdo6teQ@mail.gmail.com>
 <ec255edc-adcd-4c18-8f9c-209298f2bbff@kernel.org> <CAMhs-H9Osx__jBoxqAW1zWO4Q+nMymVfiWe_-ZSzp92Jht+JTg@mail.gmail.com>
 <cf9732b1-fd09-454e-bfd7-bef55b234175@kernel.org>
In-Reply-To: <cf9732b1-fd09-454e-bfd7-bef55b234175@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 13 Jan 2025 13:58:05 +0100
X-Gm-Features: AbW1kvZItoAEzVBlkDRcpTJEXcH5M5uK9NlkZ_6e5W8kXSjRnSstzXdFaxYrbxk
Message-ID: <CAMhs-H_6QTptfFsSEh7PKy8Fnoem1ph4j=mwT_23=J=adDDT8w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: add clock definitions for Ralink SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	yangshiji66@outlook.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 1:37=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 13/01/2025 13:29, Sergio Paracuellos wrote:
> >>>
> >>>> 2. What is the point of this? We do not add constants when there are=
 no
> >>>> users. Commit msg explains here nothing.
> >>>
> >>> All of the old ralink SoCs' dts files which are in the tree are not
> >>> properly updated. I expect to have them updated somewhere in time
> >>> merging real base stuff from openwrt dts [0] files. Not having this
> >>> header with definitions makes very hard to update dts and then
> >>> checking the driver code becomes a need to see the indexes for the
> >>> clocks to properly setup a consumer node. Because of this, this file
> >>> is added here.
> >>
> >> Still there is no point without the users. I do not see any reason why
> >> this cannot be combined with fixing driver to use the header. Not
> >> combining is an indication this is not a binding in the first place.
> >
> > Driver uses a bunch of arrays for the clocks (base, fixed, factor and
> > peripheral) and they are registered consecutively in order just using
> > the ARRAY_SIZE macro for any of them. Thus, the direct application of
> > these definitions would be for dts consumer nodes, not the driver
> > itself.
>
> So what do you constants here fix? Driver can still reorganize arrays
> breaking everything. If defining headers for proper ABI, then use that
> ABI to make everything build-time testable and visible. That's why this
> is not supposed to be a separate patch from users.

I understand your point and agree that the driver can do that, but the
idea as this driver maintainer is not to do that :).
Is adding something like the following in the binding itself with the
header addition a possible way to go?

--- a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
@@ -18,6 +18,12 @@ description: |
   These SoCs have an XTAL from where the cpu clock is
   provided as well as derived clocks for the bus and the peripherals.

+  Each clock is assigned an identifier and client nodes use this identifie=
r
+  to specify the clock which they consume.
+
+  All these identifiers could be found in:
+  [1]: <include/dt-bindings/clock/mediatek,mtmips-sysc.h>.
+
 properties:
   compatible:
     items:
@@ -38,7 +44,8 @@ properties:

   '#clock-cells':
     description:
-      The first cell indicates the clock number.
+      The first cell indicates the clock number, see [1] for available
+      clocks.
     const: 1

@@ -56,6 +63,8 @@ additionalProperties: false

 examples:
   - |
+    #include <dt-bindings/clock/mediatek,mtmips-sysc.h>
+
     syscon@0 {
       compatible =3D "ralink,rt5350-sysc", "syscon";
       reg =3D <0x0 0x100>;

I don't like the idea of changing the driver code for using these
constants since I do believe that it would make code uglier and less
maintainable. I just wanted to make things easier for the device tree
consumer nodes. So if adding this header is not a possibility with the
changes in the yaml file I will forget about this addition and this
patch.

>
> Best regards,
> Krzysztof

Thanks a lot for clarifications.

Best regards,
    Sergio Paracuellos
