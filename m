Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FB9407582
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 23:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390071; cv=none; b=sBFoYklCoSwV7KqRi2IbPKkAU+AbyLkYJLd1YmGtXjJ0n6S/fR/l0pa4p3Jao6eH1FSRbzJe9paJvv9xU7QSdELLH8N8KgXEl5yjDkz0M8qcl8kpMd+0KBgB5jV1rjsbeEi2PnUF0+XCm6N8vasxzZj3SYhTc7A7SUnXU191LI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390071; c=relaxed/simple;
	bh=9e1W24omYlHjq6eNx9Nazr8L4uxhfDCXKimATpX0Ta4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MGFdAqrXQqiUFDMpfBMSh1LXn5S6EEzIgsVjosN8QDxxbXVwxL1vnQGzI3Qbcjof9I0VfUvRY7p3oxSZnvix9tivVO/aeVMyFR5GJIHgdhvuk7RfwWfuxQ39+ORxdEw/R1n1D+KxLiJhMze9x9Ygz8DmqqKgTDcnO/tvMsyZaaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QjNUifMf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cCI5zFM4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QjNUifMf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cCI5zFM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788390064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BIDgFS+vBh0lJu9tY1UPhlN/V++WcUZggMt/Ba9cLjw=;
	b=QjNUifMf2sRA8YqlUN6JmJteF/lAZpO8B1hutMB3hbAKLT1DTl2DYiMnbaB1ugPnrD3968
	2JAEKRBQVq5ujx3DuGObi5rZhQYQZ1izH4Zs3WHUqManOnMCVP/6QFziunzTbCf6N102yI
	vvhkXgTWM4ILK215oIasz4Ku7tzCVxk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-c969Gq37OiiawrIeRBwH4g-1; Wed, 02 Sep 2026 19:01:03 -0400
X-MC-Unique: c969Gq37OiiawrIeRBwH4g-1
X-Mimecast-MFC-AGG-ID: c969Gq37OiiawrIeRBwH4g_1788390063
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9382f9430deso326652185a.1
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 16:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788390062; x=1788994862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIDgFS+vBh0lJu9tY1UPhlN/V++WcUZggMt/Ba9cLjw=;
        b=cCI5zFM4mRSwVu8cd+66bFEXDuG+sO49Vl3h6ravKGr1uApPxxeZVp0jn4wCI2tl87
         h1iFni7tX1aFoAog20Q7x2X+Pz/2UZqos0lZyA+zU4zEFZ7xiIAkPtuiIK+1ENqnUdNi
         74v+H7nqzhOXYX90z0ZeCLyQkBLoVyiH6w9xGvuuYwzGk8q39PgrWoUWGU4Ahv2dX4ir
         Ml/EhtsgbPYp90AFdw+Gx4TDl3VwQNac6JwH8OoNPP+9ZZL11/OR3/iSbHClCaQ+HyeO
         JRPen0uPVhCLTQVA2Yy0hTtffK7x4ho69sRhU3TfcR/2ohViL598QYvTntK775oxvDkG
         c13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390062; x=1788994862;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIDgFS+vBh0lJu9tY1UPhlN/V++WcUZggMt/Ba9cLjw=;
        b=GW5oDtd7KsjWYB/OItW9QHZ0DhHMMhJ5rXa9zp9hcN7SdUzhEKmkffFYvVszpLWey1
         YnGS8o2HS9KrW82rDmf+muGj0x7zQlLARraQd7w5F1zJrQrIrMOcJgPF9NJRv68Nqff9
         qacgJ+3S3XNBIRTDTF0Buu+3chdobZPCVLkInso+7/Wx4pMxI9R+HS8BmYNpzRNlZ6Ay
         M0gj/CrLxAk05b+69yHdb6VQsiSwsvIVAtwOWxvFhhWsz4+XpG8BY+UP+JeBftiGl6U8
         Q+bOqt+aIm82hzuyviyUStWtu/RPr3v0p/gTUu2TGn9Y/iH0JbiFj5j3589+UJtMAILR
         w/Gg==
X-Gm-Message-State: AFuF++mHaXEfwY1ZFkJ3ZGfzVgxXc8SdA2oNo63qakNRC5hqxBl6km2s
	IstkMxi/vuQTSu1x7UcyPyprIbh9M9i7LJ0A9BlgvkxKu00QeXnLJBu8ZNjw/sj3sG911krbKTS
	6NFYUjJkVRLDXowLgmcC1wX6dsNRnz0uGKig1qOR/tsIGC7Rvw1J4rA8N7JIdhL0Ois5ffrMMUX
	EQ3c21kPQtITqjbpsgi1nEFGS+zld6luT7uUYo4ItkIP3m
X-Gm-Gg: AYBFou0qjwqjX5A2sKqfYf2qqBSwxXz9AJN6baBJcV1X1tHDoJ2Z71MEDeLgu1pFU1j
	Wy+r5jCKESSR7qT+2YjE/xZL/QWSUmcgxY5KNhXU5+iwJxZBGxSnOTI6Ik3RJz90Qsjtg+vQFT5
	KUk43f0DtCyRl8fJRRVDYPNyC3v7fsnfHRnSUi/YtUMjeKRAxIdah+xuTNZvbmnysyuWEoh7HyW
	TrPgD6FScgfPjb/ElV0n3FihyPn9RjlsEjdovGTdjURki1GzWqhrfcPZ4/nk+W356TQqKmo7wP8
	gvNywpIKsIti90Hp87SGWTrrB86EF+oeCv7FhJSs1+evh2n+bReJp2XhuUZRINhtz8u/FSwOYrr
	ZYA==
X-Received: by 2002:a05:620a:47b6:b0:936:576e:227b with SMTP id af79cd13be357-93960f3c98amr853570485a.24.1788390057673;
        Wed, 02 Sep 2026 16:00:57 -0700 (PDT)
X-Received: by 2002:a05:620a:47b6:b0:936:576e:227b with SMTP id af79cd13be357-93960f3c98amr853562585a.24.1788390056942;
        Wed, 02 Sep 2026 16:00:56 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f3fb661sm329267285a.47.2026.09.02.16.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:00:56 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 David Lechner <david@lechnology.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260902222012.344765-1-rosenp@gmail.com>
References: <20260902222012.344765-1-rosenp@gmail.com>
Subject: Re: [PATCHv4] clk: davinci: add COMPILE_TEST support
Message-Id: <178839003514.2070477.3906603898737560270.b4-ty@b4>
Date: Wed, 02 Sep 2026 19:00:35 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=279; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=OgE5HyfBbZfZREqUFdFX9d9wOYqAbnb3ymyqMioCpuI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmrFoUIy8uJ/2PXbtZRe/bxIA49pQ/XoaOn3n8fs6em
 La/vvpGRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNJmcPwT7dlrY2jokKccOqe
 p1vihMT+Jzov8ZeuvF77fClfXoOZIiPDrVtpcQvMijK3Ttsjuqq98gibgp32i+Qki3D/62WycVY
 sAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 02 Sep 2026 15:20:12 -0700, Rosen Penev wrote:
> clk: davinci: add COMPILE_TEST support

Applied, thanks!

[1/1] clk: davinci: add COMPILE_TEST support
      commit: 551ba775497e93d93bb849f6ee572ca768cbaa3e

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

