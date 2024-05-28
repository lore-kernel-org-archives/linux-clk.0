Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690D5DDA9
	for <linux-clk@vger.kernel.org>; Tue, 28 May 2024 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929359; cv=none; b=mWlltJeLc9TNRLzFJTB/QU9lSbMQ3JsPwFS4tCG69vCJVRf8IeokYnNElKUek5Aq9On7EucLlQfbw07pNunt75VQ5n4lWCdgHdpzkpEsFZEWgUmkf8kMevkhC+TUA+Gwnm+B2/HZr1TVyfxp7EuZtVQbOgBDodWSBmIGRPmQlFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929359; c=relaxed/simple;
	bh=t4gR1TwgkM2P8pIMR2P3iEgIFg0F/aIXG0lHCXwZcXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cN7FPOMfkU2tXv3MSEPmAikOwkrBNqM/XIFmHLUFrR2jpIRDz0jny+je0amFMwgEwM91dftr97cg6pBYCIfey5Cdegi8S42uUsxeFE+jktzLcbB3Qmn1VabBBUHiAypi2T8VJplLYGmLlPn4yuzEHrfx7RkYvCsAF/XCyfR1Kc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RWu8DiaU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RWu8DiaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716929356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x78lScAkUYkJoeVm4hr0PSUkF1VUeExet6VF+YIzp4M=;
	b=RWu8DiaU8sFm5H5JxUwaDtD0/Lf1o0OGho/Uwi8x7Y3ypF/X3MkpdziCxx0+xKeu/QKjwn
	5WaTkHd0nDipiml87XnvVRDzzsugQGk3z9PEdPMs6Vkol3AFTEvq0AZk0G1SoK5wGntC7c
	bb2GoKjxqPk4rdvNZ659SKlGS4qNDL4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-t7FHNhXAPKCa86pQT_9ipw-1; Tue, 28 May 2024 16:49:13 -0400
X-MC-Unique: t7FHNhXAPKCa86pQT_9ipw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5721685A58C;
	Tue, 28 May 2024 20:49:13 +0000 (UTC)
Received: from fedora (unknown [10.22.9.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A5FF492BC6;
	Tue, 28 May 2024 20:49:12 +0000 (UTC)
Date: Tue, 28 May 2024 16:49:11 -0400
From: Audra Mitchell <audra@redhat.com>
To: Donald Zickus <dzickus@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Nico Pache <npache@redhat.com>,
	KUnit Development <kunit-dev@googlegroups.com>,
	linux-clk@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
	Audra Mitchell <aubaker@redhat.com>,
	Mark Salter <msalter@redhat.com>
Subject: Re: [Bug Report] Multiple S390x KUNIT clk failures
Message-ID: <ZlZDR3xhZfK43njo@fedora>
References: <CAA1CXcBhABB60JG-sT1qRysD1AP+bN=wo=5vwbeTv13Gj72EzA@mail.gmail.com>
 <301cd41e6283c12ac67fb8c0f8d5c929.sboyd@kernel.org>
 <CAA1CXcALWqxfoWsv_wuiu-hAmX=AosvEedheGJUQHAhDCZf2Sg@mail.gmail.com>
 <9be47cd74b62ba8e4a36f3139fc8d275.sboyd@kernel.org>
 <CAK18DXZyEHZ=1TC52kQQ89gscFLph0e_4zB_bt=DTwR-A=0UPA@mail.gmail.com>
 <CAK18DXZ223RxeV7teXjBZ-0x5U8hdmgxxL9zew3aoR7SZvxEvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK18DXZ223RxeV7teXjBZ-0x5U8hdmgxxL9zew3aoR7SZvxEvQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

On Tue, May 28, 2024 at 02:49:56PM -0400, Donald Zickus wrote:
> (trying again without the html part that gmail likes to add.  Apologies)
> 
> On Tue, May 28, 2024 at 2:45 PM Donald Zickus <dzickus@redhat.com> wrote:
> >
> > Hi Stephen,
> >
> > On Tue, May 14, 2024 at 6:04 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >>
> >> Quoting Nico Pache (2024-05-14 00:14:24)
> >> > Hi Stephen,
> >> >
> >> > Yes, we have that commit. This is failing on fedora-ark, so it's
> >> > constantly updated to match upstream, and the earliest recorded
> >> > instance of it failing in our environment is v6.1.
> >> >
> >>
> >> Please don't top post. I'm unable to run s390 kunit tests in qemu. They
> >> seem to crash before finishing.
> >
> >
> > I am working with Nico on moving this forward.  What can we do to help resolve this?

Hello all,

I spent some time last week or so working on debugging these failures and I 
believe I have found the problem. I reached out to Malk Salter for advice on 
the best way to move forward with a fix on Friday the 17th, but he was on 
PTO for the last week. I was waiting for his reply before I replied to this 
thread. 

Also as a side note, I also ran into the same issue as Stephen with running
the kunit tests on s390 QEMU. I did not pursue resolving that issue and
instead just compiled the test as a module. 

For clarity, this is what I sent to Mark and were I believe the failure is
occurring:

The tests create a pretend clk-gate and use a "fake_reg" to emulate
the expected behavior of the clk_gate->reg. I added some debug
statements to the driver and noticed that the reg changes after
initialization to -1. I also noticed that we call this to read the
data in the clk-gate->reg:

static inline u32 clk_gate_readl(struct clk_gate *gate)
{
        if (gate->flags & CLK_GATE_BIG_ENDIAN)
                return ioread32be(gate->reg);

        return readl(gate->reg);
}

However, it does not look like ioread32be is defined for s390, so
instead the compiler uses read1 (which becomes zpci_load). I checked
this by dumping the assembler of the compiled kunit clk-gate_test:

/root/linux/drivers/clk/clk-gate.c: 29
0x13214c9c6 <clk_gate_is_enabled+38>:   tm      33(%r2),4
0x13214c9ca <clk_gate_is_enabled+42>:   jne     0x13214ca82
<clk_gate_is_enabled+226>
/root/linux/./arch/s390/include/asm/pci_io.h: 64
0x13214c9ce <clk_gate_is_enabled+46>:   lghi    %r4,4
0x13214c9d2 <clk_gate_is_enabled+50>:   la      %r2,160(%r15)
0x13214c9d6 <clk_gate_is_enabled+54>:   brasl   %r14,0x131bbc3f0 <zpci_load>
0x13214c9dc <clk_gate_is_enabled+60>:   cije    %r2,0,0x13214ca78
<clk_gate_is_enabled+216>

Following up on this, I noticed that if the zpci_load is not
successful, we will return a -1:

static inline RETTYPE zpci_read_##RETTYPE(const volatile void __iomem
*addr)    \
{
         \
        u64 data;
         \
        int rc;
         \

         \
        rc = zpci_load(&data, addr, LENGTH);
         \
        if (rc)
         \
                data = -1ULL;
         \
        return (RETTYPE) data;
         \
}


All this to say, I'm not sure the best way to resolve this problem. We
need to patch clk_gate_readl() but I am not sure the best way to go
about doing this for big_endian systems.

Any recommedations on the best way to resolve this problem is welcomed!

Thanks in advance!

-- Audra Mitchell


> >
> > Cheers,
> > Don
> >
> >>
> >>
> >>  ./tools/testing/kunit/kunit.py run --kunitconfig=lib/kunit --arch=s390 --cross_compile=/path/to/s390-linux-
> >>
> >> [14:55:10] Starting KUnit Kernel (1/1)...
> >> [14:55:10] ============================================================
> >> Running tests with:
> >> $ qemu-system-s390x -nodefaults -m 1024 -kernel .kunit/arch/s390/boot/bzImage -append 'kunit.enable=1 console=ttyS0 kunit_shutdown=reboot' -no-reboot -nographic -serial stdio -machine s390-ccw-virtio -cpu qemu
> >> [14:55:11] =============================  =============================
> >> [14:55:11] ================= example_init (1 subtest) =================
> >> [14:55:11] [PASSED] example_init_test
> >> [14:55:11] ================== [PASSED] example_init ===================
> >> [14:55:11] =============================  =============================
> >> [14:55:11] ============= kunit_executor_test (8 subtests) =============
> >> [14:55:11] [PASSED] parse_filter_test
> >> [14:55:11] [PASSED] filter_suites_test
> >> [14:55:11] [PASSED] filter_suites_test_glob_test
> >> [14:55:11] [PASSED] filter_suites_to_empty_test
> >> [14:55:11] [PASSED] parse_filter_attr_test
> >> [14:55:11] [PASSED] filter_attr_test
> >> [14:55:11] [PASSED] filter_attr_empty_test
> >> [14:55:11] [PASSED] filter_attr_skip_test
> >> [14:55:11] [ERROR] Test: kunit_executor_test: Expected test number 1 but found 2
> >> [14:55:11] =============== [PASSED] kunit_executor_test ===============
> >> [14:55:11] =============================  =============================
> >> [14:55:11] ============ kunit-try-catch-test (2 subtests) =============
> >> [14:55:11] [PASSED] kunit_test_try_catch_successful_try_no_catch
> >> [14:55:11] [PASSED] kunit_test_try_catch_unsuccessful_try_does_catch
> >> [14:55:11] [ERROR] Test: kunit-try-catch-test: Expected test number 1 but found 3
> >> [14:55:11] ============== [PASSED] kunit-try-catch-test ===============
> >> [14:55:11] =============================  =============================
> >> [14:55:11] ============ kunit-resource-test (12 subtests) =============
> >> [14:55:11] [PASSED] kunit_resource_test_init_resources
> >> [14:55:11] [PASSED] kunit_resource_test_alloc_resource
> >> [14:55:11] [PASSED] kunit_resource_test_destroy_resource
> >> [14:55:11] [PASSED] kunit_resource_test_remove_resource
> >> [14:55:11] [PASSED] kunit_resource_test_cleanup_resources
> >> [14:55:11] [PASSED] kunit_resource_test_proper_free_ordering
> >> [14:55:11] [PASSED] kunit_resource_test_static
> >> [14:55:11] [PASSED] kunit_resource_test_named
> >> [14:55:11] [PASSED] kunit_resource_test_action
> >> [14:55:11] [PASSED] kunit_resource_test_remove_action
> >> [14:55:11] [PASSED] kunit_resource_test_release_action
> >> [14:55:11] [PASSED] kunit_resource_test_action_ordering
> >> [14:55:11] [ERROR] Test: kunit-resource-test: Expected test number 1 but found 4
> >> [14:55:11] =============== [PASSED] kunit-resource-test ===============
> >> [14:55:11] =============================  =============================
> >> [14:55:11] =============== kunit-log-test (2 subtests) ================
> >> [14:55:11] [PASSED] kunit_log_test
> >> [14:55:11] [SKIPPED] kunit_log_newline_test
> >> [14:55:11] [ERROR] Test: kunit-log-test: Expected test number 1 but found 5
> >> [14:55:11] ================= [PASSED] kunit-log-test ==================
> >> [14:55:11] =============================  =============================
> >> [14:55:11] ================ kunit_status (2 subtests) =================
> >> [14:55:11] [PASSED] kunit_status_set_failure_test
> >> [14:55:11] [PASSED] kunit_status_mark_skipped_test
> >> [14:55:11] [ERROR] Test: kunit_status: Expected test number 1 but found 6
> >> [14:55:11] ================== [PASSED] kunit_status ===================
> >> [14:55:11] =============================  =============================
> >> [14:55:11] ================ kunit_current (2 subtests) ================
> >> [14:55:11] [PASSED] kunit_current_test
> >> [14:55:11] [PASSED] kunit_current_fail_test
> >> [14:55:11] [ERROR] Test: kunit_current: Expected test number 1 but found 7
> >> [14:55:11] ================== [PASSED] kunit_current ==================
> >> [14:55:11] =============================  =============================
> >> [14:55:11] ================ kunit_device (3 subtests) =================
> >> [14:55:11] [PASSED] kunit_device_test
> >> [14:55:11] [PASSED] kunit_device_cleanup_test
> >> [14:55:11] [PASSED] kunit_device_driver_test
> >> [14:55:11] [ERROR] Test: kunit_device: Expected test number 1 but found 8
> >> [14:55:11] ================== [PASSED] kunit_device ===================
> >> [14:55:11] =============================  =============================
> >> [14:55:11] ============= string-stream-test (12 subtests) =============
> >> [14:55:11] [PASSED] string_stream_managed_init_test
> >> [14:55:11] [PASSED] string_stream_unmanaged_init_test
> >> [14:55:11] [PASSED] string_stream_managed_free_test
> >> [14:55:11] [PASSED] string_stream_resource_free_test
> >> [14:55:11] [PASSED] string_stream_line_add_test
> >> [14:55:11] [PASSED] string_stream_variable_length_line_test
> >> [14:55:11] [PASSED] string_stream_append_test
> >> [14:55:11] [PASSED] string_stream_append_auto_newline_test
> >> [14:55:11] [PASSED] string_stream_append_empty_string_test
> >> [14:55:11] [PASSED] string_stream_no_auto_newline_test
> >> [14:55:11] [PASSED] string_stream_auto_newline_test
> >> [14:55:11] [PASSED] string_stream_performance_test
> >> [14:55:11] [ERROR] Test: string-stream-test: Expected test number 1 but found 9
> >> [14:55:11] =============== [PASSED] string-stream-test ================
> >> [14:55:11] =============================  =============================
> >> [14:55:11] =================== example (9 subtests) ===================
> >> [14:55:11] [PASSED] example_simple_test
> >> [14:55:11] [SKIPPED] example_skip_test
> >> [14:55:11] [ERROR] Test: example: missing expected subtest!
> >> [14:55:11]
> >> [14:55:11] # example_mark_skipped_test: initializing
> >> [14:55:11]
> >> [14:55:11] # example_mark_skipped_test: You should see a line below.
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: example: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: example: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: example: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: example: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: example: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: example: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: example: missing subtest result line!
> >> [14:55:11]
> >> [14:55:11] # module: kunit_example_test
> >> [14:55:11] ==================== [CRASHED] example =====================
> >> [14:55:11]
> >> [14:55:11] # example: initializing suite
> >> [14:55:11]
> >> [14:55:11] ======================== [CRASHED]  ========================
> >> [14:55:11]
> >> [14:55:11] ======================== [CRASHED]  ========================
> >> [14:55:11]
> >> [14:55:11] ======================== [CRASHED]  ========================
> >> [14:55:11]
> >> [14:55:11] ======================== [CRASHED]  ========================
> >> [14:55:11]
> >> [14:55:11] ======================== [CRASHED]  ========================
> >> [14:55:11]
> >> [14:55:11] ======================== [CRASHED]  ========================
> >> [14:55:11]
> >> [14:55:11] ======================== [CRASHED]  ========================
> >> [14:55:11]
> >> [14:55:11] ======================== [CRASHED]  ========================
> >> [14:55:11]
> >> [14:55:11] ======================== [CRASHED]  ========================
> >> [14:55:11]
> >> [14:55:11] ======================== [CRASHED]  ========================
> >> [14:55:11] [ERROR] Test: main: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: main: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: main: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: main: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: main: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: main: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: main: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: main: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] [ERROR] Test: main: missing expected subtest!
> >> [14:55:11] [CRASHED]
> >> [14:55:11] ============================================================
> >> [14:55:11] Testing complete. Ran 62 tests: passed: 44, crashed: 16, skipped: 2, errors: 25
> >> The kernel seems to have crashed; you can decode the stack traces with:
> >> $ scripts/decode_stacktrace.sh .kunit/vmlinux .kunit < .kunit/test.log | tee .kunit/decoded.log | ./tools/testing/kunit/kunit.py parse
> >> [14:55:11] Elapsed time: 16.240s total, 1.476s configuring, 14.294s building, 0.469s running
> >>
> >> I wonder if something with my local environment is causing troubles.
> >>

