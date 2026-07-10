Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397DC3CAE7F
	for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676600; cv=none; b=gOan7yoMoVGtglgJxW1jS/IR40Afs+fpUpp1OjrWQGEk1QgM2aM5Zgx+HSS3glbZSy53j59KUGWGLy+FycquODWX1ZSXUw1+zK7r1FfQlqPIkTDGdFg+G+32kZshh56K/MRSwHOagaxebpPHQspNjmoLMezOLEPlYqdsmT9Xo3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676600; c=relaxed/simple;
	bh=g8x9dhwFyyvlvTkxK6+R/6CliWApPEOeK/YoKDP+uMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yu1oJTkd7FSoJMzI+OefVLDB7PwkA1/H/NhVg8QMFXwtWw8C+sxwkhQgDJwZTti/mTdTXV8hfNO4X4nUlcQNFzgzm23xjc0tsthB54bNP3yzLY6rNgqX5Iy5B5wU72OSLkOCjgbXzLIsExHCQfvceuz2wlHIdvboE1JztkRaWto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso116927241.2
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 02:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783676595; x=1784281395;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OJUbLwMEIOBZTFEvOkGzQdLJGFR8K38bCJj4Tk6Zpnk=;
        b=rxEVarB/VMMYs7YOhHYHj9xga5riZKm7vdBNFC90ODSh5cxoBFEMY7BD0K7Sp2QASd
         tKnUWAkynMOFHCo4uH54H/egEv2O4uhXnzA0kTHuE6Q6BXjlW3LsC1Gp+x4zKXfJRM9N
         h6Hw+lKJHGiMLOT4jd1+23yCvma3vESu/A5/6ib/11U0UHmmsusTnYnmD7AF4cFC4S5G
         AFB6H1SXG7OdGrr88ej7gaHXKLIa4NqhiK/t1FXX30y/+PK9mcyagAmhO7AzFbsxskBk
         AxuVMauPcFLGtefvIevwQd67BRh8D5auzfhNkfFbfZOK2hkwQzVIQ8T79qZDiNihF01X
         a3PA==
X-Forwarded-Encrypted: i=1; AHgh+RrBanV4G8vaRY4Jt4qxhadWBXpOozX0rpSHPsskNj4ODxIXTgZv3XnpEdLS/PcrEqGlrG4tHWEPanA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIOg5vcGEYAslVHU3NMLlX2zhpVZL2tN3tMekaVL7oIzvS10t1
	2D7VaXZ1QoWvNN4u0sLz3YN63npnbaB0E0NBY2909Vbl3t+665GogBrm+EetRtkhblE=
X-Gm-Gg: AfdE7cnGjYY+9NPQ0YuP+fIeuS9NRuCMmxv3lJHennXJlN1NZA7GfUtNwYZihmz+m63
	ANribXmtZGiGPFx9+CV7lUe3kP7qTsQJqsSYWKecG9dKqys2cTMnaFHM31FY+DHq+MBJrNQzWTn
	rSHBo2Zi6ILO1svjne35U2QZfX2nOXdEfQm1bLMPjoejX8RjWiTB71tSkDeIMdaEnEtcUYxaim3
	y1+cE6qmWlTHbyqFec/KKI5JI1BrFHLXPm30LdZX5z6ANnj5pHXBYvIsR5NvclBBC1uYIO12i0d
	fe/WWBq0Y2HP+yhcor1U5ZVv1raOZZRwi0pT3if44TgLQOPabkCdgukeQixnFeVXXgRMPtXadcY
	vOGhXUaK5Cz+jf3M+u11/nmVp2ZO7+2z7ZuEjCsm/2KbjKb+NqhEc5NBmaPU7sz+kmPVzdH/Cqg
	3dyRbWyCQeXa30tZw8tz9uFpmyA+ShZ2GfGhfK4KS0HCXpA5ZSQg==
X-Received: by 2002:a05:6122:510:b0:5a5:3eea:4513 with SMTP id 71dfb90a1353d-5bf75eabfebmr6474785e0c.12.1783676594822;
        Fri, 10 Jul 2026 02:43:14 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f5e2e70sm5251582e0c.3.2026.07.10.02.43.13
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:43:13 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-73a442f7cd3so152876137.3
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 02:43:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr0Jakw6WWsBRKAsa51kdLNAfNd4yOpDeZl5guec4l+DRKHCzFtFUI3V9HiWGBgjCZe54p6QNhJO9k=@vger.kernel.org
X-Received: by 2002:a05:6102:5494:b0:738:3525:43ff with SMTP id
 ada2fe7eead31-744e01c148dmr7640472137.13.1783676593488; Fri, 10 Jul 2026
 02:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710085744.430340-2-manuelebner@mailbox.org>
In-Reply-To: <20260710085744.430340-2-manuelebner@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 11:43:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZeNfzsN5=b_v4ociTYYxLUFT8YM0nLZ6FZE2y198U_Q@mail.gmail.com>
X-Gm-Features: AUfX_mwSwZvpHCNyboZJL6Dr0sUh2j3LLuURj3GixHiR77P7hS7W9LcUOCBov34
Message-ID: <CAMuHMdVZeNfzsN5=b_v4ociTYYxLUFT8YM0nLZ6FZE2y198U_Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: qcom,coresight-tpdm: fix bracket
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jul 2026 at 10:58, Manuel Ebner <manuelebner@mailbox.org> wrote:
> Add ')' and fix sentence structure.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

With the patch subject fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
